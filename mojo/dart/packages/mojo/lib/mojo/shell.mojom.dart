// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library shell_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo/mojo/application_connector.mojom.dart' as application_connector_mojom;
import 'package:mojo/mojo/service_provider.mojom.dart' as service_provider_mojom;



class _ShellConnectToApplicationParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String applicationUrl = null;
  service_provider_mojom.ServiceProviderInterfaceRequest services = null;

  _ShellConnectToApplicationParams() : super(kVersions.last.size);

  static _ShellConnectToApplicationParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ShellConnectToApplicationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ShellConnectToApplicationParams result = new _ShellConnectToApplicationParams();

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
      
      result.applicationUrl = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.services = decoder0.decodeInterfaceRequest(16, false, service_provider_mojom.ServiceProviderStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeString(applicationUrl, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "applicationUrl of struct _ShellConnectToApplicationParams: $e";
      rethrow;
    }
    try {
      encoder0.encodeInterfaceRequest(services, 16, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "services of struct _ShellConnectToApplicationParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_ShellConnectToApplicationParams("
           "applicationUrl: $applicationUrl" ", "
           "services: $services" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _ShellCreateApplicationConnectorParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  application_connector_mojom.ApplicationConnectorInterfaceRequest applicationConnectorRequest = null;

  _ShellCreateApplicationConnectorParams() : super(kVersions.last.size);

  static _ShellCreateApplicationConnectorParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static _ShellCreateApplicationConnectorParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ShellCreateApplicationConnectorParams result = new _ShellCreateApplicationConnectorParams();

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
      
      result.applicationConnectorRequest = decoder0.decodeInterfaceRequest(8, false, application_connector_mojom.ApplicationConnectorStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    try {
      encoder0.encodeInterfaceRequest(applicationConnectorRequest, 8, false);
    } on bindings.MojoCodecError catch(e) {
      e.message = "Error encountered while encoding field "
          "applicationConnectorRequest of struct _ShellCreateApplicationConnectorParams: $e";
      rethrow;
    }
  }

  String toString() {
    return "_ShellCreateApplicationConnectorParams("
           "applicationConnectorRequest: $applicationConnectorRequest" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}

const int _shellMethodConnectToApplicationName = 0;
const int _shellMethodCreateApplicationConnectorName = 1;

class _ShellServiceDescription implements service_describer.ServiceDescription {
  dynamic getTopLevelInterface([Function responseFactory]) =>
      responseFactory(null);

  dynamic getTypeDefinition(String typeKey, [Function responseFactory]) =>
      responseFactory(null);

  dynamic getAllTypeDefinitions([Function responseFactory]) =>
      responseFactory(null);
}

abstract class Shell {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _ShellServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static ShellProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ShellProxy p = new ShellProxy.unbound();
    String name = serviceName ?? Shell.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void connectToApplication(String applicationUrl, service_provider_mojom.ServiceProviderInterfaceRequest services);
  void createApplicationConnector(application_connector_mojom.ApplicationConnectorInterfaceRequest applicationConnectorRequest);
}

abstract class ShellInterface
    implements bindings.MojoInterface<Shell>,
               Shell {
  factory ShellInterface([Shell impl]) =>
      new ShellStub.unbound(impl);

  factory ShellInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [Shell impl]) =>
      new ShellStub.fromEndpoint(endpoint, impl);

  factory ShellInterface.fromMock(
      Shell mock) =>
      new ShellProxy.fromMock(mock);
}

abstract class ShellInterfaceRequest
    implements bindings.MojoInterface<Shell>,
               Shell {
  factory ShellInterfaceRequest() =>
      new ShellProxy.unbound();
}

class _ShellProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<Shell> {
  Shell impl;

  _ShellProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ShellProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _ShellProxyControl.unbound() : super.unbound();

  String get serviceName => Shell.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_ShellProxyControl($superString)";
  }
}

class ShellProxy
    extends bindings.Proxy<Shell>
    implements Shell,
               ShellInterface,
               ShellInterfaceRequest {
  ShellProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _ShellProxyControl.fromEndpoint(endpoint));

  ShellProxy.fromHandle(core.MojoHandle handle)
      : super(new _ShellProxyControl.fromHandle(handle));

  ShellProxy.unbound()
      : super(new _ShellProxyControl.unbound());

  factory ShellProxy.fromMock(Shell mock) {
    ShellProxy newMockedProxy =
        new ShellProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static ShellProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ShellProxy"));
    return new ShellProxy.fromEndpoint(endpoint);
  }


  void connectToApplication(String applicationUrl, service_provider_mojom.ServiceProviderInterfaceRequest services) {
    if (impl != null) {
      impl.connectToApplication(applicationUrl, services);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _ShellConnectToApplicationParams();
    params.applicationUrl = applicationUrl;
    params.services = services;
    ctrl.sendMessage(params,
        _shellMethodConnectToApplicationName);
  }
  void createApplicationConnector(application_connector_mojom.ApplicationConnectorInterfaceRequest applicationConnectorRequest) {
    if (impl != null) {
      impl.createApplicationConnector(applicationConnectorRequest);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _ShellCreateApplicationConnectorParams();
    params.applicationConnectorRequest = applicationConnectorRequest;
    ctrl.sendMessage(params,
        _shellMethodCreateApplicationConnectorName);
  }
}

class _ShellStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<Shell> {
  Shell _impl;

  _ShellStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [Shell impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _ShellStubControl.fromHandle(
      core.MojoHandle handle, [Shell impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _ShellStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => Shell.serviceName;



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
      case _shellMethodConnectToApplicationName:
        var params = _ShellConnectToApplicationParams.deserialize(
            message.payload);
        _impl.connectToApplication(params.applicationUrl, params.services);
        break;
      case _shellMethodCreateApplicationConnectorName:
        var params = _ShellCreateApplicationConnectorParams.deserialize(
            message.payload);
        _impl.createApplicationConnector(params.applicationConnectorRequest);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Shell get impl => _impl;
  set impl(Shell d) {
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
    return "_ShellStubControl($superString)";
  }

  int get version => 0;
}

class ShellStub
    extends bindings.Stub<Shell>
    implements Shell,
               ShellInterface,
               ShellInterfaceRequest {
  ShellStub.unbound([Shell impl])
      : super(new _ShellStubControl.unbound(impl));

  ShellStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [Shell impl])
      : super(new _ShellStubControl.fromEndpoint(endpoint, impl));

  ShellStub.fromHandle(
      core.MojoHandle handle, [Shell impl])
      : super(new _ShellStubControl.fromHandle(handle, impl));

  static ShellStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ShellStub"));
    return new ShellStub.fromEndpoint(endpoint);
  }


  void connectToApplication(String applicationUrl, service_provider_mojom.ServiceProviderInterfaceRequest services) {
    return impl.connectToApplication(applicationUrl, services);
  }
  void createApplicationConnector(application_connector_mojom.ApplicationConnectorInterfaceRequest applicationConnectorRequest) {
    return impl.createApplicationConnector(applicationConnectorRequest);
  }
}



