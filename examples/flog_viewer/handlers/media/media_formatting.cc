// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <iomanip>

#include "examples/flog_viewer/handlers/media/media_formatting.h"

namespace mojo {
namespace flog {
namespace examples {
namespace handlers {
namespace media {

template <typename T>
std::ostream& operator<<(std::ostream& os, const InterfacePtr<T>& value) {
  if (!value.is_bound()) {
    return os << "<not bound>" << std::endl;
  } else {
    return os << "<bound>" << std::endl;
  }
}

std::ostream& operator<<(
    std::ostream& os,
    const mojo::media::MediaSourceStreamDescriptorPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl << "index: " << int(value->index) << std::endl;
  os << begl << "media_type: " << value->media_type;
  os << begl << "original_media_type: " << value->original_media_type;
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaTypePtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl << "medium: " << StringFromMediaTypeMedium(value->medium)
     << std::endl;
  os << begl << "details: " << value->details;
  os << begl << "encoding: " << value->encoding << std::endl;
  if (value->encoding_parameters) {
    os << begl << "encoding_parameters: " << value->encoding_parameters.size()
       << " bytes" << std::endl;
  } else {
    os << begl << "encoding_parameters: <nullptr>" << std::endl;
  }
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaTypeSetPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl << "medium: " << StringFromMediaTypeMedium(value->medium)
     << std::endl;
  os << begl << "details: " << value->details;
  os << begl << "encodings: " << value->encodings;
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaTypeDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else if (value->has_unknown_tag()) {
    return os << "<empty>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  if (value->is_audio()) {
    return os << begl << "audio: " << value->get_audio() << outdent;
  }
  if (value->is_video()) {
    return os << begl << "video: " << value->get_video() << outdent;
  }
  if (value->is_text()) {
    return os << begl << "text: " << value->get_text() << outdent;
  }
  if (value->is_subpicture()) {
    return os << begl << "subpicture: " << value->get_subpicture() << outdent;
  }
  return os << begl << "UNKNOWN TAG" << std::endl << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaTypeSetDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else if (value->has_unknown_tag()) {
    return os << "<empty>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  if (value->is_audio()) {
    return os << begl << "audio: " << value->get_audio() << outdent;
  }
  if (value->is_video()) {
    return os << begl << "video: " << value->get_video() << outdent;
  }
  if (value->is_text()) {
    return os << begl << "text: " << value->get_text() << outdent;
  }
  if (value->is_subpicture()) {
    return os << begl << "subpicture: " << value->get_subpicture() << outdent;
  }
  return os << begl << "UNKNOWN TAG" << std::endl << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::AudioMediaTypeDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl
     << "sample_format: " << StringFromAudioSampleFormat(value->sample_format)
     << std::endl;
  os << begl << "channels: " << int(value->channels) << std::endl;
  os << begl << "frames_per_second: " << value->frames_per_second << std::endl;
  return os << outdent;
}

std::ostream& operator<<(
    std::ostream& os,
    const mojo::media::AudioMediaTypeSetDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl
     << "sample_format: " << StringFromAudioSampleFormat(value->sample_format)
     << std::endl;
  os << begl << "min_channels: " << int(value->min_channels) << std::endl;
  os << begl << "max_channels: " << int(value->max_channels) << std::endl;
  os << begl << "min_frames_per_second: " << value->min_frames_per_second
     << std::endl;
  os << begl << "max_frames_per_second: " << value->max_frames_per_second
     << std::endl;
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::VideoMediaTypeDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl << "profile: " << value->profile << std::endl;
  os << begl << "pixel_format: " << value->pixel_format << std::endl;
  os << begl << "color_space: " << value->color_space << std::endl;
  os << begl << "width: " << value->width << std::endl;
  os << begl << "height: " << value->height << std::endl;
  os << begl << "coded_width: " << value->coded_width << std::endl;
  os << begl << "coded_height: " << value->coded_height << std::endl;
  return os << outdent;
}

std::ostream& operator<<(
    std::ostream& os,
    const mojo::media::VideoMediaTypeSetDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl << "min_width: " << value->min_width << std::endl;
  os << begl << "max_width: " << value->max_width << std::endl;
  os << begl << "min_height: " << value->min_height << std::endl;
  os << begl << "max_height: " << value->max_height << std::endl;
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::TextMediaTypeDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << "NO MEMBERS" << std::endl;
  // TODO(dalesat): Print members here when we define some.
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::TextMediaTypeSetDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << "NO MEMBERS" << std::endl;
  // TODO(dalesat): Print members here when we define some.
  return os << outdent;
}

std::ostream& operator<<(
    std::ostream& os,
    const mojo::media::SubpictureMediaTypeDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << "NO MEMBERS" << std::endl;
  // TODO(dalesat): Print members here when we define some.
  return os << outdent;
}

std::ostream& operator<<(
    std::ostream& os,
    const mojo::media::SubpictureMediaTypeSetDetailsPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << "NO MEMBERS" << std::endl;
  // TODO(dalesat): Print members here when we define some.
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os, const TimelineTransformPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl << "reference_time: " << AsTime(value->reference_time)
     << std::endl;
  os << begl << "subject_time: " << AsTime(value->subject_time) << std::endl;
  os << begl << "reference_delta: " << value->reference_delta << std::endl;
  os << begl << "subject_delta: " << value->subject_delta << std::endl;
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaPacketPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl << "pts: " << AsTime(value->pts) << std::endl;
  os << begl << "end_of_stream: " << value->end_of_stream << std::endl;
  os << begl << "payload_buffer_id: " << value->payload_buffer_id << std::endl;
  os << begl << "payload_offset: " << value->payload_offset << std::endl;
  os << begl << "payload_size: " << value->payload_size << std::endl;
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaPacket& value) {
  os << std::endl;
  os << indent;
  os << begl << "pts: " << AsTime(value.pts) << std::endl;
  os << begl << "end_of_stream: " << value.end_of_stream << std::endl;
  os << begl << "payload_buffer_id: " << value.payload_buffer_id << std::endl;
  os << begl << "payload_offset: " << value.payload_offset << std::endl;
  os << begl << "payload_size: " << value.payload_size << std::endl;
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os,
                         const mojo::media::MediaPacketDemandPtr& value) {
  if (!value) {
    return os << "<nullptr>" << std::endl;
  } else {
    os << std::endl;
  }

  os << indent;
  os << begl << "min_packets_outstanding: " << value->min_packets_outstanding
     << std::endl;
  os << begl << "min_pts: " << AsTime(value->min_pts) << std::endl;
  return os << outdent;
}

std::ostream& operator<<(std::ostream& os, AsTime value) {
  int64_t time = value.time_;

  if (time == kUnspecifiedTime) {
    return os << "unspecified";
  }

  if (time < 0) {
    time = -time;
    os << "-";
  }

  return os << time / 1000000000ll << "." << std::setw(9) << std::setfill('0')
            << time % 1000000000ll;
}

const char* StringFromMediaTypeMedium(mojo::media::MediaTypeMedium value) {
  switch (value) {
    case mojo::media::MediaTypeMedium::AUDIO:
      return "AUDIO";
    case mojo::media::MediaTypeMedium::VIDEO:
      return "VIDEO";
    case mojo::media::MediaTypeMedium::TEXT:
      return "TEXT";
    case mojo::media::MediaTypeMedium::SUBPICTURE:
      return "SUBPICTURE";
  }
  return "UNKNOWN MEDIUM";
}

const char* StringFromAudioSampleFormat(mojo::media::AudioSampleFormat value) {
  switch (value) {
    case mojo::media::AudioSampleFormat::ANY:
      return "ANY";
    case mojo::media::AudioSampleFormat::UNSIGNED_8:
      return "UNSIGNED_8";
    case mojo::media::AudioSampleFormat::SIGNED_16:
      return "SIGNED_16";
    case mojo::media::AudioSampleFormat::SIGNED_24_IN_32:
      return "SIGNED_24_IN_32";
    case mojo::media::AudioSampleFormat::FLOAT:
      return "FLOAT";
  }
  return "UNKNOWN FORMAT";
}

}  // namespace media
}  // namespace handlers
}  // namespace examples
}  // namespace flog
}  // namespace mojo
