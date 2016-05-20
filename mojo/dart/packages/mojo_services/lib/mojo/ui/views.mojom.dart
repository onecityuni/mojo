// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library views_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo/mojo/service_provider.mojom.dart' as service_provider_mojom;
import 'package:mojo_services/mojo/gfx/composition/scenes.mojom.dart' as scenes_mojom;
import 'package:mojo_services/mojo/ui/view_containers.mojom.dart' as view_containers_mojom;
import 'package:mojo_services/mojo/ui/view_properties.mojom.dart' as view_properties_mojom;
import 'package:mojo_services/mojo/ui/view_token.mojom.dart' as view_token_mojom;



class _ViewGetTokenParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _ViewGetTokenParams() : super(kVersions.last.size);

  static _ViewGetTokenParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ViewGetTokenParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ViewGetTokenParams result = new _ViewGetTokenParams();

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
    return "_ViewGetTokenParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class ViewGetTokenResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  view_token_mojom.ViewToken token = null;

  ViewGetTokenResponseParams() : super(kVersions.last.size);

  static ViewGetTokenResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ViewGetTokenResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewGetTokenResponseParams result = new ViewGetTokenResponseParams();

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
      result.token = view_token_mojom.ViewToken.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeStruct(token, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "token of struct ViewGetTokenResponseParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "ViewGetTokenResponseParams("
           "token: $token" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["token"] = token;
    return map;
  }
}


class _ViewGetServiceProviderParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  service_provider_mojom.ServiceProviderInterfaceRequest serviceProvider = null;

  _ViewGetServiceProviderParams() : super(kVersions.last.size);

  static _ViewGetServiceProviderParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ViewGetServiceProviderParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ViewGetServiceProviderParams result = new _ViewGetServiceProviderParams();

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
      
      result.serviceProvider = decoder0.decodeInterfaceRequest(8, false, service_provider_mojom.ServiceProviderStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterfaceRequest(serviceProvider, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "serviceProvider of struct _ViewGetServiceProviderParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_ViewGetServiceProviderParams("
           "serviceProvider: $serviceProvider" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _ViewCreateSceneParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  scenes_mojom.SceneInterfaceRequest scene = null;

  _ViewCreateSceneParams() : super(kVersions.last.size);

  static _ViewCreateSceneParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ViewCreateSceneParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ViewCreateSceneParams result = new _ViewCreateSceneParams();

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
      
      result.scene = decoder0.decodeInterfaceRequest(8, false, scenes_mojom.SceneStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterfaceRequest(scene, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "scene of struct _ViewCreateSceneParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_ViewCreateSceneParams("
           "scene: $scene" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _ViewGetContainerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  view_containers_mojom.ViewContainerInterfaceRequest container = null;

  _ViewGetContainerParams() : super(kVersions.last.size);

  static _ViewGetContainerParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ViewGetContainerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ViewGetContainerParams result = new _ViewGetContainerParams();

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
      
      result.container = decoder0.decodeInterfaceRequest(8, false, view_containers_mojom.ViewContainerStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterfaceRequest(container, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "container of struct _ViewGetContainerParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_ViewGetContainerParams("
           "container: $container" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _ViewListenerOnPropertiesChangedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int sceneVersion = 0;
  view_properties_mojom.ViewProperties properties = null;

  _ViewListenerOnPropertiesChangedParams() : super(kVersions.last.size);

  static _ViewListenerOnPropertiesChangedParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ViewListenerOnPropertiesChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ViewListenerOnPropertiesChangedParams result = new _ViewListenerOnPropertiesChangedParams();

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
      
      result.sceneVersion = decoder0.decodeUint32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.properties = view_properties_mojom.ViewProperties.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeUint32(sceneVersion, 8);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "sceneVersion of struct _ViewListenerOnPropertiesChangedParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeStruct(properties, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "properties of struct _ViewListenerOnPropertiesChangedParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_ViewListenerOnPropertiesChangedParams("
           "sceneVersion: $sceneVersion" ", "
           "properties: $properties" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["sceneVersion"] = sceneVersion;
    map["properties"] = properties;
    return map;
  }
}


class ViewListenerOnPropertiesChangedResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  ViewListenerOnPropertiesChangedResponseParams() : super(kVersions.last.size);

  static ViewListenerOnPropertiesChangedResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ViewListenerOnPropertiesChangedResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewListenerOnPropertiesChangedResponseParams result = new ViewListenerOnPropertiesChangedResponseParams();

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
    return "ViewListenerOnPropertiesChangedResponseParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}

const int _viewMethodGetTokenName = 0;
const int _viewMethodGetServiceProviderName = 1;
const int _viewMethodCreateSceneName = 2;
const int _viewMethodGetContainerName = 3;

class _ViewServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class View {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _ViewServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static ViewProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ViewProxy p = new ViewProxy.unbound();
    String name = serviceName ?? View.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  dynamic getToken([Function responseFactory = null]);
  void getServiceProvider(service_provider_mojom.ServiceProviderInterfaceRequest serviceProvider);
  void createScene(scenes_mojom.SceneInterfaceRequest scene);
  void getContainer(view_containers_mojom.ViewContainerInterfaceRequest container);
}

abstract class ViewInterface
    implements bindings.MojoInterface<View>,
               View {
  factory ViewInterface([View impl]) =>
      new ViewStub.unbound(impl);
  factory ViewInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [View impl]) =>
      new ViewStub.fromEndpoint(endpoint, impl);
}

abstract class ViewInterfaceRequest
    implements bindings.MojoInterface<View>,
               View {
  factory ViewInterfaceRequest() =>
      new ViewProxy.unbound();
}

class _ViewProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<View> {
  _ViewProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ViewProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _ViewProxyControl.unbound() : super.unbound();

  String get serviceName => View.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _viewMethodGetTokenName:
        var r = ViewGetTokenResponseParams.deserialize(
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

  View get impl => null;
  set impl(View _) {
    throw new core.MojoApiError("The impl of a Proxy cannot be set.");
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_ViewProxyControl($superString)";
  }
}

class ViewProxy
    extends bindings.Proxy<View>
    implements View,
               ViewInterface,
               ViewInterfaceRequest {
  ViewProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _ViewProxyControl.fromEndpoint(endpoint));

  ViewProxy.fromHandle(core.MojoHandle handle)
      : super(new _ViewProxyControl.fromHandle(handle));

  ViewProxy.unbound()
      : super(new _ViewProxyControl.unbound());

  static ViewProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewProxy"));
    return new ViewProxy.fromEndpoint(endpoint);
  }


  dynamic getToken([Function responseFactory = null]) {
    var params = new _ViewGetTokenParams();
    return ctrl.sendMessageWithRequestId(
        params,
        _viewMethodGetTokenName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void getServiceProvider(service_provider_mojom.ServiceProviderInterfaceRequest serviceProvider) {
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _ViewGetServiceProviderParams();
    params.serviceProvider = serviceProvider;
    ctrl.sendMessage(params,
        _viewMethodGetServiceProviderName);
  }
  void createScene(scenes_mojom.SceneInterfaceRequest scene) {
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _ViewCreateSceneParams();
    params.scene = scene;
    ctrl.sendMessage(params,
        _viewMethodCreateSceneName);
  }
  void getContainer(view_containers_mojom.ViewContainerInterfaceRequest container) {
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _ViewGetContainerParams();
    params.container = container;
    ctrl.sendMessage(params,
        _viewMethodGetContainerName);
  }
}

class _ViewStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<View> {
  View _impl;

  _ViewStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [View impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _ViewStubControl.fromHandle(
      core.MojoHandle handle, [View impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _ViewStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => View.serviceName;


  ViewGetTokenResponseParams _viewGetTokenResponseParamsFactory(view_token_mojom.ViewToken token) {
    var result = new ViewGetTokenResponseParams();
    result.token = token;
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
      case _viewMethodGetTokenName:
        var response = _impl.getToken(_viewGetTokenResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _viewMethodGetTokenName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _viewMethodGetTokenName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case _viewMethodGetServiceProviderName:
        var params = _ViewGetServiceProviderParams.deserialize(
            message.payload);
        _impl.getServiceProvider(params.serviceProvider);
        break;
      case _viewMethodCreateSceneName:
        var params = _ViewCreateSceneParams.deserialize(
            message.payload);
        _impl.createScene(params.scene);
        break;
      case _viewMethodGetContainerName:
        var params = _ViewGetContainerParams.deserialize(
            message.payload);
        _impl.getContainer(params.container);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  View get impl => _impl;
  set impl(View d) {
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
    return "_ViewStubControl($superString)";
  }

  int get version => 0;
}

class ViewStub
    extends bindings.Stub<View>
    implements View,
               ViewInterface,
               ViewInterfaceRequest {
  ViewStub.unbound([View impl])
      : super(new _ViewStubControl.unbound(impl));

  ViewStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [View impl])
      : super(new _ViewStubControl.fromEndpoint(endpoint, impl));

  ViewStub.fromHandle(
      core.MojoHandle handle, [View impl])
      : super(new _ViewStubControl.fromHandle(handle, impl));

  static ViewStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewStub"));
    return new ViewStub.fromEndpoint(endpoint);
  }


  dynamic getToken([Function responseFactory = null]) {
    return impl.getToken(responseFactory);
  }
  void getServiceProvider(service_provider_mojom.ServiceProviderInterfaceRequest serviceProvider) {
    return impl.getServiceProvider(serviceProvider);
  }
  void createScene(scenes_mojom.SceneInterfaceRequest scene) {
    return impl.createScene(scene);
  }
  void getContainer(view_containers_mojom.ViewContainerInterfaceRequest container) {
    return impl.getContainer(container);
  }
}

const int _viewListenerMethodOnPropertiesChangedName = 0;

class _ViewListenerServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class ViewListener {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _ViewListenerServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static ViewListenerProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ViewListenerProxy p = new ViewListenerProxy.unbound();
    String name = serviceName ?? ViewListener.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  dynamic onPropertiesChanged(int sceneVersion,view_properties_mojom.ViewProperties properties,[Function responseFactory = null]);
}

abstract class ViewListenerInterface
    implements bindings.MojoInterface<ViewListener>,
               ViewListener {
  factory ViewListenerInterface([ViewListener impl]) =>
      new ViewListenerStub.unbound(impl);
  factory ViewListenerInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [ViewListener impl]) =>
      new ViewListenerStub.fromEndpoint(endpoint, impl);
}

abstract class ViewListenerInterfaceRequest
    implements bindings.MojoInterface<ViewListener>,
               ViewListener {
  factory ViewListenerInterfaceRequest() =>
      new ViewListenerProxy.unbound();
}

class _ViewListenerProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<ViewListener> {
  _ViewListenerProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ViewListenerProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _ViewListenerProxyControl.unbound() : super.unbound();

  String get serviceName => ViewListener.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _viewListenerMethodOnPropertiesChangedName:
        var r = ViewListenerOnPropertiesChangedResponseParams.deserialize(
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

  ViewListener get impl => null;
  set impl(ViewListener _) {
    throw new core.MojoApiError("The impl of a Proxy cannot be set.");
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_ViewListenerProxyControl($superString)";
  }
}

class ViewListenerProxy
    extends bindings.Proxy<ViewListener>
    implements ViewListener,
               ViewListenerInterface,
               ViewListenerInterfaceRequest {
  ViewListenerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _ViewListenerProxyControl.fromEndpoint(endpoint));

  ViewListenerProxy.fromHandle(core.MojoHandle handle)
      : super(new _ViewListenerProxyControl.fromHandle(handle));

  ViewListenerProxy.unbound()
      : super(new _ViewListenerProxyControl.unbound());

  static ViewListenerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewListenerProxy"));
    return new ViewListenerProxy.fromEndpoint(endpoint);
  }


  dynamic onPropertiesChanged(int sceneVersion,view_properties_mojom.ViewProperties properties,[Function responseFactory = null]) {
    var params = new _ViewListenerOnPropertiesChangedParams();
    params.sceneVersion = sceneVersion;
    params.properties = properties;
    return ctrl.sendMessageWithRequestId(
        params,
        _viewListenerMethodOnPropertiesChangedName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class _ViewListenerStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<ViewListener> {
  ViewListener _impl;

  _ViewListenerStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [ViewListener impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _ViewListenerStubControl.fromHandle(
      core.MojoHandle handle, [ViewListener impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _ViewListenerStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => ViewListener.serviceName;


  ViewListenerOnPropertiesChangedResponseParams _viewListenerOnPropertiesChangedResponseParamsFactory() {
    var result = new ViewListenerOnPropertiesChangedResponseParams();
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
      case _viewListenerMethodOnPropertiesChangedName:
        var params = _ViewListenerOnPropertiesChangedParams.deserialize(
            message.payload);
        var response = _impl.onPropertiesChanged(params.sceneVersion,params.properties,_viewListenerOnPropertiesChangedResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  _viewListenerMethodOnPropertiesChangedName,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              _viewListenerMethodOnPropertiesChangedName,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ViewListener get impl => _impl;
  set impl(ViewListener d) {
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
    return "_ViewListenerStubControl($superString)";
  }

  int get version => 0;
}

class ViewListenerStub
    extends bindings.Stub<ViewListener>
    implements ViewListener,
               ViewListenerInterface,
               ViewListenerInterfaceRequest {
  ViewListenerStub.unbound([ViewListener impl])
      : super(new _ViewListenerStubControl.unbound(impl));

  ViewListenerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [ViewListener impl])
      : super(new _ViewListenerStubControl.fromEndpoint(endpoint, impl));

  ViewListenerStub.fromHandle(
      core.MojoHandle handle, [ViewListener impl])
      : super(new _ViewListenerStubControl.fromHandle(handle, impl));

  static ViewListenerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ViewListenerStub"));
    return new ViewListenerStub.fromEndpoint(endpoint);
  }


  dynamic onPropertiesChanged(int sceneVersion,view_properties_mojom.ViewProperties properties,[Function responseFactory = null]) {
    return impl.onPropertiesChanged(sceneVersion,properties,responseFactory);
  }
}



