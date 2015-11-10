// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This Mojo app is a benchmark of Dart <=> Dart IPC Round Trip Times.
// To run it:
//
// $ ./mojo/devtools/common/mojo_benchmark [--release] mojo/tools/data/rtt_benchmarks

import 'dart:async';
import 'dart:isolate';

import 'package:common/tracing_helper.dart';
import 'package:mojo/application.dart';
import 'package:mojo/core.dart';

void echoIsolate(SendPort sendPort) {
  var receivePort = new RawReceivePort();
  sendPort.send(receivePort.sendPort);
  receivePort.handler = ((msg) {
    sendPort.send(msg);
  });
}

class IsolateMessageApp extends Application {
  static const Duration _WARMUP_DURATION = const Duration(seconds: 1);
  static const Duration _DELAY = const Duration(microseconds: 50);
  TracingHelper _tracing;
  RawReceivePort _receivePort;
  SendPort _sendPort;
  Completer _sendPortCompleter;
  Isolate _isolate;
  List<Completer> _completers;
  bool _doEcho;
  bool _warmup;

  IsolateMessageApp.fromHandle(MojoHandle handle) : super.fromHandle(handle) {
    onError = _errorHandler;
  }

  void initialize(List<String> args, String url) {
    // Initialize tracing.
    _tracing = new TracingHelper.fromApplication(this, "isolate_rtt_benchmark");

    // Start echoing.
    _doEcho = true;
    _completers = [];
    _sendPortCompleter = new Completer();
    _receivePort = new RawReceivePort();
    _receivePort.handler = _isolateMessageHandler;
    Isolate.spawn(echoIsolate, _receivePort.sendPort).then((isolate) {
      _isolate = isolate;
      _sendPortCompleter.future.then((sendPort) {
        _sendPort = sendPort;
        _run();
      });
    });

    // Begin tracing echo rtts after waiting for _WARMUP_DURATION.
    _warmup = true;
    new Timer(_WARMUP_DURATION, () => _warmup = false);
  }

  _run() {
    if (_doEcho) {
      if (_warmup) {
        _echo("ping").then((_) => new Timer(_DELAY, _run));
      } else {
        _tracedEcho().then((_) => new Timer(_DELAY, _run));
      }
    }
  }

  Future _tracedEcho() {
    int start = getTimeTicksNow();
    return _echo("ping").then((_) {
      int end = getTimeTicksNow();
      _tracing.traceDuration("ping", "isolate_rtt_benchmark", start, end);
    });
  }

  Future _echo(String s) {
    var completer = new Completer();
    _completers.add(completer);
    _sendPort.send("ping");
    return completer.future;
  }

  _isolateMessageHandler(msg) {
    if (msg is SendPort) {
      _sendPortCompleter.complete(msg);
    } else {
      var completer = _completers.removeAt(0);
      completer.complete(null);
    }
  }

  void _errorHandler() {
    _doEcho = false;
    _receivePort.close();
    MojoHandle.reportLeakedHandles();
  }
}

main(List args) {
  MojoHandle appHandle = new MojoHandle(args[0]);
  new IsolateMessageApp.fromHandle(appHandle);
}
