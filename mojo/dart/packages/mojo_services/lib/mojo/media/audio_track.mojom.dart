// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library audio_track_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo_services/mojo/media/media_transport.mojom.dart' as media_transport_mojom;
import 'package:mojo_services/mojo/media/media_types.mojom.dart' as media_types_mojom;
import 'package:mojo_services/mojo/media/timeline_controller.mojom.dart' as timeline_controller_mojom;



class AudioTrackDescriptor extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<media_types_mojom.MediaTypeSet> supportedMediaTypes = null;

  AudioTrackDescriptor() : super(kVersions.last.size);

  static AudioTrackDescriptor deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static AudioTrackDescriptor decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AudioTrackDescriptor result = new AudioTrackDescriptor();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.supportedMediaTypes = new List<media_types_mojom.MediaTypeSet>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.supportedMediaTypes[i1] = media_types_mojom.MediaTypeSet.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      if (supportedMediaTypes == null) {
        encoder0.encodeNullPointer(8, false);
      } else {
        var encoder1 = encoder0.encodePointerArray(supportedMediaTypes.length, 8, bindings.kUnspecifiedArrayLength);
        for (int i0 = 0; i0 < supportedMediaTypes.length; ++i0) {
          encoder1.encodeStruct(supportedMediaTypes[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
        }
      }
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "supportedMediaTypes of struct AudioTrackDescriptor: $e";
      rethrow;
    }
  }

  String toString() {
    return "AudioTrackDescriptor("
           "supportedMediaTypes: $supportedMediaTypes" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["supportedMediaTypes"] = supportedMediaTypes;
    return map;
  }
}


class AudioTrackConfiguration extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  media_types_mojom.MediaType mediaType = null;
  int audioFrameRatio = 1;
  int mediaTimeRatio = 1;

  AudioTrackConfiguration() : super(kVersions.last.size);

  static AudioTrackConfiguration deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static AudioTrackConfiguration decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AudioTrackConfiguration result = new AudioTrackConfiguration();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.mediaType = media_types_mojom.MediaType.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.audioFrameRatio = decoder0.decodeUint32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.mediaTimeRatio = decoder0.decodeUint32(20);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(mediaType, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "mediaType of struct AudioTrackConfiguration: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(audioFrameRatio, 16);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "audioFrameRatio of struct AudioTrackConfiguration: $e";
      rethrow;
    }
    try {
      encoder0.encodeUint32(mediaTimeRatio, 20);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "mediaTimeRatio of struct AudioTrackConfiguration: $e";
      rethrow;
    }
  }

  String toString() {
    return "AudioTrackConfiguration("
           "mediaType: $mediaType" ", "
           "audioFrameRatio: $audioFrameRatio" ", "
           "mediaTimeRatio: $mediaTimeRatio" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["mediaType"] = mediaType;
    map["audioFrameRatio"] = audioFrameRatio;
    map["mediaTimeRatio"] = mediaTimeRatio;
    return map;
  }
}


class _AudioTrackDescribeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _AudioTrackDescribeParams() : super(kVersions.last.size);

  static _AudioTrackDescribeParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _AudioTrackDescribeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _AudioTrackDescribeParams result = new _AudioTrackDescribeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "_AudioTrackDescribeParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class AudioTrackDescribeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  AudioTrackDescriptor descriptor = null;

  AudioTrackDescribeResponseParams() : super(kVersions.last.size);

  static AudioTrackDescribeResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static AudioTrackDescribeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AudioTrackDescribeResponseParams result = new AudioTrackDescribeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.descriptor = AudioTrackDescriptor.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(descriptor, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "descriptor of struct AudioTrackDescribeResponseParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "AudioTrackDescribeResponseParams("
           "descriptor: $descriptor" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["descriptor"] = descriptor;
    return map;
  }
}


class _AudioTrackConfigureParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  AudioTrackConfiguration configuration = null;
  media_transport_mojom.MediaConsumerInterfaceRequest pipe = null;

  _AudioTrackConfigureParams() : super(kVersions.last.size);

  static _AudioTrackConfigureParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _AudioTrackConfigureParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _AudioTrackConfigureParams result = new _AudioTrackConfigureParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.configuration = AudioTrackConfiguration.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.pipe = decoder0.decodeInterfaceRequest(16, false, media_transport_mojom.MediaConsumerStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(configuration, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "configuration of struct _AudioTrackConfigureParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInterfaceRequest(pipe, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "pipe of struct _AudioTrackConfigureParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_AudioTrackConfigureParams("
           "configuration: $configuration" ", "
           "pipe: $pipe" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _AudioTrackGetTimelineControlSiteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  timeline_controller_mojom.MediaTimelineControlSiteInterfaceRequest timelineControlSite = null;

  _AudioTrackGetTimelineControlSiteParams() : super(kVersions.last.size);

  static _AudioTrackGetTimelineControlSiteParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _AudioTrackGetTimelineControlSiteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _AudioTrackGetTimelineControlSiteParams result = new _AudioTrackGetTimelineControlSiteParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.timelineControlSite = decoder0.decodeInterfaceRequest(8, false, timeline_controller_mojom.MediaTimelineControlSiteStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterfaceRequest(timelineControlSite, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "timelineControlSite of struct _AudioTrackGetTimelineControlSiteParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_AudioTrackGetTimelineControlSiteParams("
           "timelineControlSite: $timelineControlSite" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _AudioTrackSetGainParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  double dbGain = 0.0;

  _AudioTrackSetGainParams() : super(kVersions.last.size);

  static _AudioTrackSetGainParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _AudioTrackSetGainParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _AudioTrackSetGainParams result = new _AudioTrackSetGainParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.dbGain = decoder0.decodeFloat(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeFloat(dbGain, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "dbGain of struct _AudioTrackSetGainParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_AudioTrackSetGainParams("
           "dbGain: $dbGain" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["dbGain"] = dbGain;
    return map;
  }
}

const int _audioTrackMethodDescribeName = 0;
const int _audioTrackMethodConfigureName = 1;
const int _audioTrackMethodGetTimelineControlSiteName = 2;
const int _audioTrackMethodSetGainName = 3;

class _AudioTrackServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class AudioTrack {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _AudioTrackServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static AudioTrackProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    AudioTrackProxy p = new AudioTrackProxy.unbound();
    String name = serviceName ?? AudioTrack.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  dynamic describe([Function responseFactory = null]);
  void configure(AudioTrackConfiguration configuration, media_transport_mojom.MediaConsumerInterfaceRequest pipe);
  void getTimelineControlSite(timeline_controller_mojom.MediaTimelineControlSiteInterfaceRequest timelineControlSite);
  void setGain(double dbGain);
  static const double kMutedGain = -160.0;
  static const double kMaxGain = 20.0;
}

abstract class AudioTrackInterface
    implements bindings.MojoInterface<AudioTrack>,
               AudioTrack {
  factory AudioTrackInterface([AudioTrack impl]) =>
      new AudioTrackStub.unbound(impl);
  factory AudioTrackInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [AudioTrack impl]) =>
      new AudioTrackStub.fromEndpoint(endpoint, impl);
}

abstract class AudioTrackInterfaceRequest
    implements bindings.MojoInterface<AudioTrack>,
               AudioTrack {
  factory AudioTrackInterfaceRequest() =>
      new AudioTrackProxy.unbound();
}

class _AudioTrackProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<AudioTrack> {
  _AudioTrackProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _AudioTrackProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _AudioTrackProxyControl.unbound() : super.unbound();

  String get serviceName => AudioTrack.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _audioTrackMethodDescribeName:
        var r = AudioTrackDescribeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  AudioTrack get impl => null;
  set impl(AudioTrack _) {
    throw new core.MojoApiError("The impl of a Proxy cannot be set.");
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_AudioTrackProxyControl($superString)";
  }
}

class AudioTrackProxy
    extends bindings.Proxy<AudioTrack>
    implements AudioTrack,
               AudioTrackInterface,
               AudioTrackInterfaceRequest {
  AudioTrackProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _AudioTrackProxyControl.fromEndpoint(endpoint));

  AudioTrackProxy.fromHandle(core.MojoHandle handle)
      : super(new _AudioTrackProxyControl.fromHandle(handle));

  AudioTrackProxy.unbound()
      : super(new _AudioTrackProxyControl.unbound());

  static AudioTrackProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For AudioTrackProxy"));
    return new AudioTrackProxy.fromEndpoint(endpoint);
  }


  dynamic describe([Function responseFactory = null]) {
    var params = new _AudioTrackDescribeParams();
    return ctrl.sendMessageWithRequestId(
        params,
        _audioTrackMethodDescribeName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void configure(AudioTrackConfiguration configuration, media_transport_mojom.MediaConsumerInterfaceRequest pipe) {
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _AudioTrackConfigureParams();
    params.configuration = configuration;
    params.pipe = pipe;
    ctrl.sendMessage(params,
        _audioTrackMethodConfigureName);
  }
  void getTimelineControlSite(timeline_controller_mojom.MediaTimelineControlSiteInterfaceRequest timelineControlSite) {
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _AudioTrackGetTimelineControlSiteParams();
    params.timelineControlSite = timelineControlSite;
    ctrl.sendMessage(params,
        _audioTrackMethodGetTimelineControlSiteName);
  }
  void setGain(double dbGain) {
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _AudioTrackSetGainParams();
    params.dbGain = dbGain;
    ctrl.sendMessage(params,
        _audioTrackMethodSetGainName);
  }
}

class _AudioTrackStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<AudioTrack> {
  AudioTrack _impl;

  _AudioTrackStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [AudioTrack impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _AudioTrackStubControl.fromHandle(
      core.MojoHandle handle, [AudioTrack impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _AudioTrackStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => AudioTrack.serviceName;


  AudioTrackDescribeResponseParams _audioTrackDescribeResponseParamsFactory(AudioTrackDescriptor descriptor) {
    var result = new AudioTrackDescribeResponseParams();
    result.descriptor = descriptor;
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _audioTrackMethodDescribeName:
        var response = _impl.describe(_audioTrackDescribeResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _audioTrackMethodDescribeName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _audioTrackMethodDescribeName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _audioTrackMethodConfigureName:
        var params = _AudioTrackConfigureParams.deserialize(
            message.payload);
        _impl.configure(params.configuration, params.pipe);
        break;
      case _audioTrackMethodGetTimelineControlSiteName:
        var params = _AudioTrackGetTimelineControlSiteParams.deserialize(
            message.payload);
        _impl.getTimelineControlSite(params.timelineControlSite);
        break;
      case _audioTrackMethodSetGainName:
        var params = _AudioTrackSetGainParams.deserialize(
            message.payload);
        _impl.setGain(params.dbGain);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  AudioTrack get impl => _impl;
  set impl(AudioTrack d) {
    if (d == null) {
      throw new core.MojoApiError("$this: Cannot set a null implementation");
    }
    if (isBound && (_impl == null)) {
      beginHandlingEvents();
    }
    _impl = d;
  }

  @override
  void bind(core.MojoMessagePipeEndpoint endpoint) {
    super.bind(endpoint);
    if (!isOpen && (_impl != null)) {
      beginHandlingEvents();
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_AudioTrackStubControl($superString)";
  }

  int get version => 0;
}

class AudioTrackStub
    extends bindings.Stub<AudioTrack>
    implements AudioTrack,
               AudioTrackInterface,
               AudioTrackInterfaceRequest {
  AudioTrackStub.unbound([AudioTrack impl])
      : super(new _AudioTrackStubControl.unbound(impl));

  AudioTrackStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [AudioTrack impl])
      : super(new _AudioTrackStubControl.fromEndpoint(endpoint, impl));

  AudioTrackStub.fromHandle(
      core.MojoHandle handle, [AudioTrack impl])
      : super(new _AudioTrackStubControl.fromHandle(handle, impl));

  static AudioTrackStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For AudioTrackStub"));
    return new AudioTrackStub.fromEndpoint(endpoint);
  }


  dynamic describe([Function responseFactory = null]) {
    return impl.describe(responseFactory);
  }
  void configure(AudioTrackConfiguration configuration, media_transport_mojom.MediaConsumerInterfaceRequest pipe) {
    return impl.configure(configuration, pipe);
  }
  void getTimelineControlSite(timeline_controller_mojom.MediaTimelineControlSiteInterfaceRequest timelineControlSite) {
    return impl.getTimelineControlSite(timelineControlSite);
  }
  void setGain(double dbGain) {
    return impl.setGain(dbGain);
  }
}



