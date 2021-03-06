// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "examples/flog_viewer/handlers/media/media_packet_producer_full.h"

#include <iostream>

#include "examples/flog_viewer/flog_viewer.h"
#include "examples/flog_viewer/handlers/media/media_formatting.h"
#include "mojo/services/media/logs/interfaces/media_packet_producer_channel.mojom.h"

namespace mojo {
namespace flog {
namespace examples {
namespace handlers {
namespace media {

MediaPacketProducerFull::MediaPacketProducerFull(const std::string& format)
    : terse_(format == FlogViewer::kFormatTerse) {
  stub_.set_sink(this);
}

MediaPacketProducerFull::~MediaPacketProducerFull() {}

void MediaPacketProducerFull::HandleMessage(Message* message) {
  stub_.Accept(message);
}

void MediaPacketProducerFull::Connecting() {
  std::cout << entry() << "MediaPacketProducer.Connecting" << std::endl;
}

void MediaPacketProducerFull::Resetting() {
  std::cout << entry() << "MediaPacketProducer.Resetting" << std::endl;
}

void MediaPacketProducerFull::RequestingFlush() {
  std::cout << entry() << "MediaPacketProducer.RequestingFlush" << std::endl;
}

void MediaPacketProducerFull::FlushCompleted() {
  std::cout << entry() << "MediaPacketProducer.FlushCompleted" << std::endl;
}

void MediaPacketProducerFull::AllocatingPayloadBuffer(uint32_t index,
                                                      uint64_t size,
                                                      uint64_t buffer) {
  if (terse_) {
    return;
  }
  std::cout << entry() << "MediaPacketProducer.AllocatingPayloadBuffer"
            << std::endl;
  std::cout << indent;
  std::cout << begl << "index: " << index << std::endl;
  std::cout << begl << "size: " << size << std::endl;
  std::cout << begl << "buffer: " << AsAddress(buffer) << std::endl;
  std::cout << outdent;
}

void MediaPacketProducerFull::PayloadBufferAllocationFailure(uint32_t index,
                                                             uint64_t size) {
  std::cout << entry() << "MediaPacketProducer.PayloadBufferAllocationFailure"
            << std::endl;
  std::cout << indent;
  std::cout << begl << "index: " << index << std::endl;
  std::cout << begl << "size: " << size << std::endl;
  std::cout << outdent;
}

void MediaPacketProducerFull::ReleasingPayloadBuffer(uint32_t index,
                                                     uint64_t buffer) {
  if (terse_) {
    return;
  }

  std::cout << entry() << "MediaPacketProducer.ReleasingPayloadBuffer"
            << std::endl;
  std::cout << indent;
  std::cout << begl << "index: " << index << std::endl;
  std::cout << begl << "buffer: " << AsAddress(buffer) << std::endl;
  std::cout << outdent;
}

void MediaPacketProducerFull::DemandUpdated(
    mojo::media::MediaPacketDemandPtr demand) {
  if (terse_) {
    return;
  }

  std::cout << entry() << indent;
  std::cout << "MediaPacketProducer.DemandUpdated" << std::endl;
  std::cout << begl << "demand: " << demand;
  std::cout << outdent;
}

void MediaPacketProducerFull::ProducingPacket(
    uint64_t label,
    mojo::media::MediaPacketPtr packet,
    uint64_t payload_address,
    uint32_t packets_outstanding) {
  if (terse_) {
    return;
  }

  std::cout << entry() << "MediaPacketProducer.ProducingPacket" << std::endl;
  std::cout << indent;
  std::cout << begl << "label: " << label << std::endl;
  std::cout << begl << "packet: " << packet;
  std::cout << begl << "payload_address: " << AsAddress(payload_address)
            << std::endl;
  std::cout << begl << "packets_outstanding: " << packets_outstanding
            << std::endl;
  std::cout << outdent;
}

void MediaPacketProducerFull::RetiringPacket(uint64_t label,
                                             uint32_t packets_outstanding) {
  if (terse_) {
    return;
  }

  std::cout << entry() << "MediaPacketProducer.RetiringPacket" << std::endl;
  std::cout << indent;
  std::cout << begl << "label: " << label << std::endl;
  std::cout << begl << "packets_outstanding: " << packets_outstanding
            << std::endl;
  std::cout << outdent;
}

}  // namespace media
}  // namespace handlers
}  // namespace examples
}  // namespace flog
}  // namespace mojo
