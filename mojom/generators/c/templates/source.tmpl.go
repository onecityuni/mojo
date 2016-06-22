// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package templates

const GenerateSourceFile = `
{{- define "GenerateSourceFile" -}}
// This file was auto-generated by the C bindings generator.

#include "{{.HeaderFile}}"

#include <stdbool.h>

#include "mojo/public/c/bindings/lib/type_descriptor.h"
#include "mojo/public/c/system/handle.h"

// Imports.
{{range $import := .Imports -}}
#include "{{$import}}"
{{end}}

// Type tables definitions for structs, arrays and unions.
{{template "GenerateTypeTableDefinitions" .TypeTable}}

// Definitions for constants.
// Top level constants:
{{range $const := .Constants -}}
const {{$const.Type}} {{$const.Name}} = {{$const.Value}};
{{end -}}

// Struct level constants:
{{range $struct := .Structs -}}
{{range $const := $struct.Constants -}}
const {{$const.Type}} {{$const.Name}} = {{$const.Value}};
{{end -}}
{{end -}}

// Interface level constants:
{{range $interface := .Interfaces -}}
{{range $const := $interface.Constants -}}
const {{$const.Type}} {{$const.Name}} = {{$const.Value}};
{{end -}}
{{end -}}

{{end}}
`
