// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "examples/media_test/media_test.h"
#include "mojo/public/cpp/application/connect.h"
#include "mojo/services/media/common/cpp/timeline.h"
#include "mojo/services/media/common/cpp/timeline_function.h"
#include "mojo/services/media/control/interfaces/media_factory.mojom.h"

namespace mojo {
namespace media {
namespace examples {

// static
std::unique_ptr<MediaTest> MediaTest::Create(
    mojo::ApplicationImpl* app,
    const std::string& input_file_name) {
  return std::unique_ptr<MediaTest>(new MediaTest(app, input_file_name));
}

MediaTest::MediaTest(mojo::ApplicationImpl* app,
                     const std::string& input_file_name)
    : state_(MediaState::UNPREPARED) {
  MediaFactoryPtr factory;
  ConnectToService(app->shell(), "mojo:media_factory", GetProxy(&factory));

  SeekingReaderPtr reader;
  factory->CreateNetworkReader(input_file_name, GetProxy(&reader));
  factory->CreatePlayer(reader.Pass(), GetProxy(&media_player_));

  HandleStatusUpdates();
}

MediaTest::~MediaTest() {}

int64_t MediaTest::position_ns() const {
  // Apply the timeline function to the current time.
  int64_t position = timeline_function_(Timeline::local_now());

  if (position < 0) {
    position = 0;
  }

  if (metadata_ && static_cast<uint64_t>(position) > metadata_->duration) {
    position = metadata_->duration;
  }

  return position;
}

const MediaMetadataPtr& MediaTest::metadata() const {
  return metadata_;
}

void MediaTest::HandleStatusUpdates(uint64_t version,
                                    MediaPlayerStatusPtr status) {
  if (status) {
    // Process status received from the player.
    previous_state_ = state_;
    state_ = status->state;

    if (status->timeline_transform) {
      timeline_function_ = status->timeline_transform.To<TimelineFunction>();
    }

    metadata_ = status->metadata.Pass();

    if (update_callback_ != nullptr) {
      update_callback_();
    }
  }

  // Request a status update.
  media_player_->GetStatus(
      version, [this](uint64_t version, MediaPlayerStatusPtr status) {
        HandleStatusUpdates(version, status.Pass());
      });
}

}  // namespace examples
}  // namespace media
}  // namespace mojo
