// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library regression_tests_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
class EnumWithReference extends bindings.MojoEnum {
  static const k_STEREO_AND_KEYBOARD_MIC = const EnumWithReference._(30);
  static const k_MAX = const EnumWithReference._(30);

  const EnumWithReference._(int v) : super(v);

  static const Map<String, EnumWithReference> valuesMap = const {
    "k_STEREO_AND_KEYBOARD_MIC": k_STEREO_AND_KEYBOARD_MIC,
    "k_MAX": k_MAX,
  };
  static const List<EnumWithReference> values = const [
    k_STEREO_AND_KEYBOARD_MIC,
    k_MAX,
  ];

  static EnumWithReference valueOf(String name) => valuesMap[name];

  factory EnumWithReference(int v) {
    switch (v) {
      case 30:
        return k_STEREO_AND_KEYBOARD_MIC;
      case 30:
        return k_MAX;
      default:
        return null;
    }
  }

  static EnumWithReference decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    EnumWithReference result = new EnumWithReference(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum EnumWithReference.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case k_STEREO_AND_KEYBOARD_MIC:
        return 'EnumWithReference.k_STEREO_AND_KEYBOARD_MIC';
      case k_MAX:
        return 'EnumWithReference.k_MAX';
    }
  }

  int toJson() => value;
}
class EnumWithLowercase extends bindings.MojoEnum {
  static const PlanarF16 = const EnumWithLowercase._(0);
  static const PlanarF32 = const EnumWithLowercase._(1);

  const EnumWithLowercase._(int v) : super(v);

  static const Map<String, EnumWithLowercase> valuesMap = const {
    "PlanarF16": PlanarF16,
    "PlanarF32": PlanarF32,
  };
  static const List<EnumWithLowercase> values = const [
    PlanarF16,
    PlanarF32,
  ];

  static EnumWithLowercase valueOf(String name) => valuesMap[name];

  factory EnumWithLowercase(int v) {
    switch (v) {
      case 0:
        return PlanarF16;
      case 1:
        return PlanarF32;
      default:
        return null;
    }
  }

  static EnumWithLowercase decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    EnumWithLowercase result = new EnumWithLowercase(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum EnumWithLowercase.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case PlanarF16:
        return 'EnumWithLowercase.PlanarF16';
      case PlanarF32:
        return 'EnumWithLowercase.PlanarF32';
    }
  }

  int toJson() => value;
}
class EnumWithNumbers extends bindings.MojoEnum {
  static const k_2_1 = const EnumWithNumbers._(4);

  const EnumWithNumbers._(int v) : super(v);

  static const Map<String, EnumWithNumbers> valuesMap = const {
    "k_2_1": k_2_1,
  };
  static const List<EnumWithNumbers> values = const [
    k_2_1,
  ];

  static EnumWithNumbers valueOf(String name) => valuesMap[name];

  factory EnumWithNumbers(int v) {
    switch (v) {
      case 4:
        return k_2_1;
      default:
        return null;
    }
  }

  static EnumWithNumbers decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    EnumWithNumbers result = new EnumWithNumbers(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum EnumWithNumbers.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case k_2_1:
        return 'EnumWithNumbers.k_2_1';
    }
  }

  int toJson() => value;
}
class EnumWithK extends bindings.MojoEnum {
  static const K = const EnumWithK._(0);

  const EnumWithK._(int v) : super(v);

  static const Map<String, EnumWithK> valuesMap = const {
    "K": K,
  };
  static const List<EnumWithK> values = const [
    K,
  ];

  static EnumWithK valueOf(String name) => valuesMap[name];

  factory EnumWithK(int v) {
    switch (v) {
      case 0:
        return K;
      default:
        return null;
    }
  }

  static EnumWithK decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    EnumWithK result = new EnumWithK(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum EnumWithK.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case K:
        return 'EnumWithK.K';
    }
  }

  int toJson() => value;
}
class EnumWithInternalAllCaps extends bindings.MojoEnum {
  static const STANDARD = const EnumWithInternalAllCaps._(0);
  static const FULLSCREEN = const EnumWithInternalAllCaps._(1);
  static const IMMERSIVE = const EnumWithInternalAllCaps._(2);

  const EnumWithInternalAllCaps._(int v) : super(v);

  static const Map<String, EnumWithInternalAllCaps> valuesMap = const {
    "STANDARD": STANDARD,
    "FULLSCREEN": FULLSCREEN,
    "IMMERSIVE": IMMERSIVE,
  };
  static const List<EnumWithInternalAllCaps> values = const [
    STANDARD,
    FULLSCREEN,
    IMMERSIVE,
  ];

  static EnumWithInternalAllCaps valueOf(String name) => valuesMap[name];

  factory EnumWithInternalAllCaps(int v) {
    switch (v) {
      case 0:
        return STANDARD;
      case 1:
        return FULLSCREEN;
      case 2:
        return IMMERSIVE;
      default:
        return null;
    }
  }

  static EnumWithInternalAllCaps decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    EnumWithInternalAllCaps result = new EnumWithInternalAllCaps(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum EnumWithInternalAllCaps.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case STANDARD:
        return 'EnumWithInternalAllCaps.STANDARD';
      case FULLSCREEN:
        return 'EnumWithInternalAllCaps.FULLSCREEN';
      case IMMERSIVE:
        return 'EnumWithInternalAllCaps.IMMERSIVE';
    }
  }

  int toJson() => value;
}
class NormalEnum extends bindings.MojoEnum {
  static const FIRST = const NormalEnum._(0);
  static const SECOND = const NormalEnum._(1);

  const NormalEnum._(int v) : super(v);

  static const Map<String, NormalEnum> valuesMap = const {
    "FIRST": FIRST,
    "SECOND": SECOND,
  };
  static const List<NormalEnum> values = const [
    FIRST,
    SECOND,
  ];

  static NormalEnum valueOf(String name) => valuesMap[name];

  factory NormalEnum(int v) {
    switch (v) {
      case 0:
        return FIRST;
      case 1:
        return SECOND;
      default:
        return null;
    }
  }

  static NormalEnum decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    NormalEnum result = new NormalEnum(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum NormalEnum.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case FIRST:
        return 'NormalEnum.FIRST';
      case SECOND:
        return 'NormalEnum.SECOND';
    }
  }

  int toJson() => value;
}



class Edge extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Vertex v = null;

  Edge() : super(kVersions.last.size);

  static Edge deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Edge decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Edge result = new Edge();

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
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.v = Vertex.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(v, 8, true);
  }

  String toString() {
    return "Edge("
           "v: $v" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["v"] = v;
    return map;
  }
}


class Vertex extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  EmptyStruct e = null;

  Vertex() : super(kVersions.last.size);

  static Vertex deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Vertex decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Vertex result = new Vertex();

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
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.e = EmptyStruct.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(e, 8, true);
  }

  String toString() {
    return "Vertex("
           "e: $e" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["e"] = e;
    return map;
  }
}


class EmptyStruct extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  EmptyStruct() : super(kVersions.last.size);

  static EmptyStruct deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static EmptyStruct decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EmptyStruct result = new EmptyStruct();

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
    return "EmptyStruct("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class A extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  B b = null;

  A() : super(kVersions.last.size);

  static A deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static A decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    A result = new A();

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
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.b = B.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(b, 8, true);
  }

  String toString() {
    return "A("
           "b: $b" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["b"] = b;
    return map;
  }
}


class B extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  A a = null;

  B() : super(kVersions.last.size);

  static B deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static B decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    B result = new B();

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
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.a = A.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(a, 8, true);
  }

  String toString() {
    return "B("
           "a: $a" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["a"] = a;
    return map;
  }
}


class StructWithHandleCalledHandles extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  core.MojoHandle handles = null;

  StructWithHandleCalledHandles() : super(kVersions.last.size);

  static StructWithHandleCalledHandles deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static StructWithHandleCalledHandles decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    StructWithHandleCalledHandles result = new StructWithHandleCalledHandles();

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
      
      result.handles = decoder0.decodeHandle(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeHandle(handles, 8, false);
  }

  String toString() {
    return "StructWithHandleCalledHandles("
           "handles: $handles" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class StructWithArrayOfHandlesCalledHandles extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<core.MojoHandle> handles = null;

  StructWithArrayOfHandlesCalledHandles() : super(kVersions.last.size);

  static StructWithArrayOfHandlesCalledHandles deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static StructWithArrayOfHandlesCalledHandles decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    StructWithArrayOfHandlesCalledHandles result = new StructWithArrayOfHandlesCalledHandles();

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
      
      result.handles = decoder0.decodeHandleArray(8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeHandleArray(handles, 8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "StructWithArrayOfHandlesCalledHandles("
           "handles: $handles" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class StructWithInterfaceCalledHandles extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Object handles = null;

  StructWithInterfaceCalledHandles() : super(kVersions.last.size);

  static StructWithInterfaceCalledHandles deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static StructWithInterfaceCalledHandles decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    StructWithInterfaceCalledHandles result = new StructWithInterfaceCalledHandles();

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
      
      result.handles = decoder0.decodeServiceInterface(8, false, TestInterfaceProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterface(handles, 8, false);
  }

  String toString() {
    return "StructWithInterfaceCalledHandles("
           "handles: $handles" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class ContainsArrayOfEnum extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<NormalEnum> arrayOfEnums = null;

  ContainsArrayOfEnum() : super(kVersions.last.size);

  static ContainsArrayOfEnum deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ContainsArrayOfEnum decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ContainsArrayOfEnum result = new ContainsArrayOfEnum();

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
        var si1 = decoder1.decodeDataHeaderForEnumArray(bindings.kUnspecifiedArrayLength);
        result.arrayOfEnums = new List<NormalEnum>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
            result.arrayOfEnums[i1] = NormalEnum.decode(decoder1, bindings.ArrayDataHeader.kHeaderSize + bindings.kEnumSize * i1);
            if (result.arrayOfEnums[i1] == null) {
              throw new bindings.MojoCodecError(
                'Trying to decode null union for non-nullable NormalEnum.');
            }
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeEnumArray(arrayOfEnums, 8, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
  }

  String toString() {
    return "ContainsArrayOfEnum("
           "arrayOfEnums: $arrayOfEnums" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["arrayOfEnums"] = arrayOfEnums;
    return map;
  }
}


class CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams() : super(kVersions.last.size);

  static CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams result = new CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams();

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
    return "CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams() : super(kVersions.last.size);

  static CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams result = new CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams();

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
    return "CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  bool b = false;

  CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams() : super(kVersions.last.size);

  static CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams result = new CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams();

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
      
      result.b = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeBool(b, 8, 0);
  }

  String toString() {
    return "CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams("
           "b: $b" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["b"] = b;
    return map;
  }
}


class CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams() : super(kVersions.last.size);

  static CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams result = new CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams();

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
    return "CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class CheckNameCollisionWithNameCollisionParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  bool message = false;
  bool response = false;

  CheckNameCollisionWithNameCollisionParams() : super(kVersions.last.size);

  static CheckNameCollisionWithNameCollisionParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CheckNameCollisionWithNameCollisionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckNameCollisionWithNameCollisionParams result = new CheckNameCollisionWithNameCollisionParams();

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
      
      result.message = decoder0.decodeBool(8, 0);
    }
    if (mainDataHeader.version >= 0) {
      
      result.response = decoder0.decodeBool(8, 1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeBool(message, 8, 0);
    
    encoder0.encodeBool(response, 8, 1);
  }

  String toString() {
    return "CheckNameCollisionWithNameCollisionParams("
           "message: $message" ", "
           "response: $response" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["message"] = message;
    map["response"] = response;
    return map;
  }
}


class CheckNameCollisionWithNameCollisionResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  bool message = false;
  bool response = false;

  CheckNameCollisionWithNameCollisionResponseParams() : super(kVersions.last.size);

  static CheckNameCollisionWithNameCollisionResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CheckNameCollisionWithNameCollisionResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckNameCollisionWithNameCollisionResponseParams result = new CheckNameCollisionWithNameCollisionResponseParams();

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
      
      result.message = decoder0.decodeBool(8, 0);
    }
    if (mainDataHeader.version >= 0) {
      
      result.response = decoder0.decodeBool(8, 1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeBool(message, 8, 0);
    
    encoder0.encodeBool(response, 8, 1);
  }

  String toString() {
    return "CheckNameCollisionWithNameCollisionResponseParams("
           "message: $message" ", "
           "response: $response" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["message"] = message;
    map["response"] = response;
    return map;
  }
}


class CheckEnumCapsSetEnumWithInternalAllCapsParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  EnumWithInternalAllCaps e = null;

  CheckEnumCapsSetEnumWithInternalAllCapsParams() : super(kVersions.last.size);

  static CheckEnumCapsSetEnumWithInternalAllCapsParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static CheckEnumCapsSetEnumWithInternalAllCapsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckEnumCapsSetEnumWithInternalAllCapsParams result = new CheckEnumCapsSetEnumWithInternalAllCapsParams();

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
      
        result.e = EnumWithInternalAllCaps.decode(decoder0, 8);
        if (result.e == null) {
          throw new bindings.MojoCodecError(
            'Trying to decode null union for non-nullable EnumWithInternalAllCaps.');
        }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeEnum(e, 8);
  }

  String toString() {
    return "CheckEnumCapsSetEnumWithInternalAllCapsParams("
           "e: $e" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["e"] = e;
    return map;
  }
}


class TestInterfaceSomeMessageParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TestInterfaceSomeMessageParams() : super(kVersions.last.size);

  static TestInterfaceSomeMessageParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static TestInterfaceSomeMessageParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TestInterfaceSomeMessageParams result = new TestInterfaceSomeMessageParams();

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
    return "TestInterfaceSomeMessageParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}

const int kCheckMethodWithEmptyResponse_withoutParameterAndEmptyResponse_name = 0;
const int kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name = 1;

const String CheckMethodWithEmptyResponseName =
      'regression_tests::CheckMethodWithEmptyResponse';

abstract class CheckMethodWithEmptyResponse {
  dynamic withoutParameterAndEmptyResponse([Function responseFactory = null]);
  dynamic withParameterAndEmptyResponse(bool b,[Function responseFactory = null]);

}


class CheckMethodWithEmptyResponseProxyImpl extends bindings.Proxy {
  CheckMethodWithEmptyResponseProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  CheckMethodWithEmptyResponseProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CheckMethodWithEmptyResponseProxyImpl.unbound() : super.unbound();

  static CheckMethodWithEmptyResponseProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckMethodWithEmptyResponseProxyImpl"));
    return new CheckMethodWithEmptyResponseProxyImpl.fromEndpoint(endpoint);
  }

  String get name => CheckMethodWithEmptyResponseName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kCheckMethodWithEmptyResponse_withoutParameterAndEmptyResponse_name:
        var r = CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams.deserialize(
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
      case kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name:
        var r = CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams.deserialize(
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

  String toString() {
    var superString = super.toString();
    return "CheckMethodWithEmptyResponseProxyImpl($superString)";
  }
}


class _CheckMethodWithEmptyResponseProxyCalls implements CheckMethodWithEmptyResponse {
  CheckMethodWithEmptyResponseProxyImpl _proxyImpl;

  _CheckMethodWithEmptyResponseProxyCalls(this._proxyImpl);
    dynamic withoutParameterAndEmptyResponse([Function responseFactory = null]) {
      var params = new CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kCheckMethodWithEmptyResponse_withoutParameterAndEmptyResponse_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic withParameterAndEmptyResponse(bool b,[Function responseFactory = null]) {
      var params = new CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams();
      params.b = b;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class CheckMethodWithEmptyResponseProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  CheckMethodWithEmptyResponse ptr;
  final String name = CheckMethodWithEmptyResponseName;

  CheckMethodWithEmptyResponseProxy(CheckMethodWithEmptyResponseProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _CheckMethodWithEmptyResponseProxyCalls(proxyImpl);

  CheckMethodWithEmptyResponseProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new CheckMethodWithEmptyResponseProxyImpl.fromEndpoint(endpoint) {
    ptr = new _CheckMethodWithEmptyResponseProxyCalls(impl);
  }

  CheckMethodWithEmptyResponseProxy.fromHandle(core.MojoHandle handle) :
      impl = new CheckMethodWithEmptyResponseProxyImpl.fromHandle(handle) {
    ptr = new _CheckMethodWithEmptyResponseProxyCalls(impl);
  }

  CheckMethodWithEmptyResponseProxy.unbound() :
      impl = new CheckMethodWithEmptyResponseProxyImpl.unbound() {
    ptr = new _CheckMethodWithEmptyResponseProxyCalls(impl);
  }

  factory CheckMethodWithEmptyResponseProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    CheckMethodWithEmptyResponseProxy p = new CheckMethodWithEmptyResponseProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static CheckMethodWithEmptyResponseProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckMethodWithEmptyResponseProxy"));
    return new CheckMethodWithEmptyResponseProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "CheckMethodWithEmptyResponseProxy($impl)";
  }
}


class CheckMethodWithEmptyResponseStub extends bindings.Stub {
  CheckMethodWithEmptyResponse _impl = null;

  CheckMethodWithEmptyResponseStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  CheckMethodWithEmptyResponseStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  CheckMethodWithEmptyResponseStub.unbound() : super.unbound();

  static CheckMethodWithEmptyResponseStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckMethodWithEmptyResponseStub"));
    return new CheckMethodWithEmptyResponseStub.fromEndpoint(endpoint);
  }

  static const String name = CheckMethodWithEmptyResponseName;


  CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams _CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParamsFactory() {
    var result = new CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParams();
    return result;
  }
  CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams _CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParamsFactory() {
    var result = new CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams();
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kCheckMethodWithEmptyResponse_withoutParameterAndEmptyResponse_name:
        var params = CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseParams.deserialize(
            message.payload);
        var response = _impl.withoutParameterAndEmptyResponse(_CheckMethodWithEmptyResponseWithoutParameterAndEmptyResponseResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kCheckMethodWithEmptyResponse_withoutParameterAndEmptyResponse_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kCheckMethodWithEmptyResponse_withoutParameterAndEmptyResponse_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name:
        var params = CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams.deserialize(
            message.payload);
        var response = _impl.withParameterAndEmptyResponse(params.b,_CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name,
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

  CheckMethodWithEmptyResponse get impl => _impl;
  set impl(CheckMethodWithEmptyResponse d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "CheckMethodWithEmptyResponseStub($superString)";
  }

  int get version => 0;
}

const int kCheckNameCollision_withNameCollision_name = 0;

const String CheckNameCollisionName =
      'regression_tests::CheckNameCollision';

abstract class CheckNameCollision {
  dynamic withNameCollision(bool message,bool response,[Function responseFactory = null]);

}


class CheckNameCollisionProxyImpl extends bindings.Proxy {
  CheckNameCollisionProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  CheckNameCollisionProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CheckNameCollisionProxyImpl.unbound() : super.unbound();

  static CheckNameCollisionProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckNameCollisionProxyImpl"));
    return new CheckNameCollisionProxyImpl.fromEndpoint(endpoint);
  }

  String get name => CheckNameCollisionName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kCheckNameCollision_withNameCollision_name:
        var r = CheckNameCollisionWithNameCollisionResponseParams.deserialize(
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

  String toString() {
    var superString = super.toString();
    return "CheckNameCollisionProxyImpl($superString)";
  }
}


class _CheckNameCollisionProxyCalls implements CheckNameCollision {
  CheckNameCollisionProxyImpl _proxyImpl;

  _CheckNameCollisionProxyCalls(this._proxyImpl);
    dynamic withNameCollision(bool message,bool response,[Function responseFactory = null]) {
      var params = new CheckNameCollisionWithNameCollisionParams();
      params.message = message;
      params.response = response;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kCheckNameCollision_withNameCollision_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class CheckNameCollisionProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  CheckNameCollision ptr;
  final String name = CheckNameCollisionName;

  CheckNameCollisionProxy(CheckNameCollisionProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _CheckNameCollisionProxyCalls(proxyImpl);

  CheckNameCollisionProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new CheckNameCollisionProxyImpl.fromEndpoint(endpoint) {
    ptr = new _CheckNameCollisionProxyCalls(impl);
  }

  CheckNameCollisionProxy.fromHandle(core.MojoHandle handle) :
      impl = new CheckNameCollisionProxyImpl.fromHandle(handle) {
    ptr = new _CheckNameCollisionProxyCalls(impl);
  }

  CheckNameCollisionProxy.unbound() :
      impl = new CheckNameCollisionProxyImpl.unbound() {
    ptr = new _CheckNameCollisionProxyCalls(impl);
  }

  factory CheckNameCollisionProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    CheckNameCollisionProxy p = new CheckNameCollisionProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static CheckNameCollisionProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckNameCollisionProxy"));
    return new CheckNameCollisionProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "CheckNameCollisionProxy($impl)";
  }
}


class CheckNameCollisionStub extends bindings.Stub {
  CheckNameCollision _impl = null;

  CheckNameCollisionStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  CheckNameCollisionStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  CheckNameCollisionStub.unbound() : super.unbound();

  static CheckNameCollisionStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckNameCollisionStub"));
    return new CheckNameCollisionStub.fromEndpoint(endpoint);
  }

  static const String name = CheckNameCollisionName;


  CheckNameCollisionWithNameCollisionResponseParams _CheckNameCollisionWithNameCollisionResponseParamsFactory(bool message, bool response) {
    var result = new CheckNameCollisionWithNameCollisionResponseParams();
    result.message = message;
    result.response = response;
    return result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kCheckNameCollision_withNameCollision_name:
        var params = CheckNameCollisionWithNameCollisionParams.deserialize(
            message.payload);
        var response = _impl.withNameCollision(params.message,params.response,_CheckNameCollisionWithNameCollisionResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kCheckNameCollision_withNameCollision_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kCheckNameCollision_withNameCollision_name,
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

  CheckNameCollision get impl => _impl;
  set impl(CheckNameCollision d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "CheckNameCollisionStub($superString)";
  }

  int get version => 0;
}

const int kCheckEnumCaps_setEnumWithInternalAllCaps_name = 0;

const String CheckEnumCapsName =
      'regression_tests::CheckEnumCaps';

abstract class CheckEnumCaps {
  void setEnumWithInternalAllCaps(EnumWithInternalAllCaps e);

}


class CheckEnumCapsProxyImpl extends bindings.Proxy {
  CheckEnumCapsProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  CheckEnumCapsProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CheckEnumCapsProxyImpl.unbound() : super.unbound();

  static CheckEnumCapsProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckEnumCapsProxyImpl"));
    return new CheckEnumCapsProxyImpl.fromEndpoint(endpoint);
  }

  String get name => CheckEnumCapsName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "CheckEnumCapsProxyImpl($superString)";
  }
}


class _CheckEnumCapsProxyCalls implements CheckEnumCaps {
  CheckEnumCapsProxyImpl _proxyImpl;

  _CheckEnumCapsProxyCalls(this._proxyImpl);
    void setEnumWithInternalAllCaps(EnumWithInternalAllCaps e) {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new CheckEnumCapsSetEnumWithInternalAllCapsParams();
      params.e = e;
      _proxyImpl.sendMessage(params, kCheckEnumCaps_setEnumWithInternalAllCaps_name);
    }
  
}


class CheckEnumCapsProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  CheckEnumCaps ptr;
  final String name = CheckEnumCapsName;

  CheckEnumCapsProxy(CheckEnumCapsProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _CheckEnumCapsProxyCalls(proxyImpl);

  CheckEnumCapsProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new CheckEnumCapsProxyImpl.fromEndpoint(endpoint) {
    ptr = new _CheckEnumCapsProxyCalls(impl);
  }

  CheckEnumCapsProxy.fromHandle(core.MojoHandle handle) :
      impl = new CheckEnumCapsProxyImpl.fromHandle(handle) {
    ptr = new _CheckEnumCapsProxyCalls(impl);
  }

  CheckEnumCapsProxy.unbound() :
      impl = new CheckEnumCapsProxyImpl.unbound() {
    ptr = new _CheckEnumCapsProxyCalls(impl);
  }

  factory CheckEnumCapsProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    CheckEnumCapsProxy p = new CheckEnumCapsProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static CheckEnumCapsProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckEnumCapsProxy"));
    return new CheckEnumCapsProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "CheckEnumCapsProxy($impl)";
  }
}


class CheckEnumCapsStub extends bindings.Stub {
  CheckEnumCaps _impl = null;

  CheckEnumCapsStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  CheckEnumCapsStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  CheckEnumCapsStub.unbound() : super.unbound();

  static CheckEnumCapsStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For CheckEnumCapsStub"));
    return new CheckEnumCapsStub.fromEndpoint(endpoint);
  }

  static const String name = CheckEnumCapsName;



  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kCheckEnumCaps_setEnumWithInternalAllCaps_name:
        var params = CheckEnumCapsSetEnumWithInternalAllCapsParams.deserialize(
            message.payload);
        _impl.setEnumWithInternalAllCaps(params.e);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  CheckEnumCaps get impl => _impl;
  set impl(CheckEnumCaps d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "CheckEnumCapsStub($superString)";
  }

  int get version => 0;
}

const int kTestInterface_someMessage_name = 0;

const String TestInterfaceName =
      'regression_tests::TestInterface';

abstract class TestInterface {
  void someMessage();

}


class TestInterfaceProxyImpl extends bindings.Proxy {
  TestInterfaceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TestInterfaceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TestInterfaceProxyImpl.unbound() : super.unbound();

  static TestInterfaceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TestInterfaceProxyImpl"));
    return new TestInterfaceProxyImpl.fromEndpoint(endpoint);
  }

  String get name => TestInterfaceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "TestInterfaceProxyImpl($superString)";
  }
}


class _TestInterfaceProxyCalls implements TestInterface {
  TestInterfaceProxyImpl _proxyImpl;

  _TestInterfaceProxyCalls(this._proxyImpl);
    void someMessage() {
      if (!_proxyImpl.isBound) {
        _proxyImpl.proxyError("The Proxy is closed.");
        return;
      }
      var params = new TestInterfaceSomeMessageParams();
      _proxyImpl.sendMessage(params, kTestInterface_someMessage_name);
    }
  
}


class TestInterfaceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  TestInterface ptr;
  final String name = TestInterfaceName;

  TestInterfaceProxy(TestInterfaceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TestInterfaceProxyCalls(proxyImpl);

  TestInterfaceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TestInterfaceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TestInterfaceProxyCalls(impl);
  }

  TestInterfaceProxy.fromHandle(core.MojoHandle handle) :
      impl = new TestInterfaceProxyImpl.fromHandle(handle) {
    ptr = new _TestInterfaceProxyCalls(impl);
  }

  TestInterfaceProxy.unbound() :
      impl = new TestInterfaceProxyImpl.unbound() {
    ptr = new _TestInterfaceProxyCalls(impl);
  }

  factory TestInterfaceProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    TestInterfaceProxy p = new TestInterfaceProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static TestInterfaceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TestInterfaceProxy"));
    return new TestInterfaceProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "TestInterfaceProxy($impl)";
  }
}


class TestInterfaceStub extends bindings.Stub {
  TestInterface _impl = null;

  TestInterfaceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TestInterfaceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TestInterfaceStub.unbound() : super.unbound();

  static TestInterfaceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TestInterfaceStub"));
    return new TestInterfaceStub.fromEndpoint(endpoint);
  }

  static const String name = TestInterfaceName;



  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kTestInterface_someMessage_name:
        var params = TestInterfaceSomeMessageParams.deserialize(
            message.payload);
        _impl.someMessage();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  TestInterface get impl => _impl;
  set impl(TestInterface d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TestInterfaceStub($superString)";
  }

  int get version => 0;
}


