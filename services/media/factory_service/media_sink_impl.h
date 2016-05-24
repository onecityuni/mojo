// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef MOJO_SERVICES_MEDIA_FACTORY_MEDIA_SINK_IMPL_H_
#define MOJO_SERVICES_MEDIA_FACTORY_MEDIA_SINK_IMPL_H_

#include <memory>

#include "mojo/public/cpp/application/application_impl.h"
#include "mojo/public/cpp/bindings/binding.h"
#include "mojo/services/media/control/interfaces/media_sink.mojom.h"
#include "mojo/services/media/core/interfaces/timeline_controller.mojom.h"
#include "services/media/factory_service/audio_track_controller.h"
#include "services/media/factory_service/factory_service.h"
#include "services/media/framework/graph.h"
#include "services/media/framework/parts/decoder.h"
#include "services/media/framework/util/incident.h"
#include "services/media/framework_mojo/mojo_consumer.h"
#include "services/media/framework_mojo/mojo_producer.h"

namespace mojo {
namespace media {

// Mojo agent that consumes a stream and delivers it to a destination specified
// by URL.
class MediaSinkImpl : public MediaFactoryService::Product<MediaSink>,
                      public MediaSink {
 public:
  static std::shared_ptr<MediaSinkImpl> Create(
      const String& destination_url,
      MediaTypePtr media_type,
      InterfaceRequest<MediaSink> request,
      MediaFactoryService* owner);

  ~MediaSinkImpl() override;

  // MediaSink implementation.
  void GetConsumer(InterfaceRequest<MediaConsumer> consumer) override;

  void GetTimelineControlSite(
      InterfaceRequest<MediaTimelineControlSite> req) override;

 private:
  MediaSinkImpl(const String& destination_url,
                MediaTypePtr media_type,
                InterfaceRequest<MediaSink> request,
                MediaFactoryService* owner);

  Incident ready_;
  Graph graph_;
  std::shared_ptr<MojoConsumer> consumer_;
  std::shared_ptr<MojoProducer> producer_;
  std::unique_ptr<AudioTrackController> controller_;
};

}  // namespace media
}  // namespace mojo

#endif  // MOJO_SERVICES_MEDIA_FACTORY_MEDIA_SINK_IMPL_H_
