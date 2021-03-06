// Copyright 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef SERVICES_JS_SYSTEM_MOJO_RUNNER_DELEGATE_H_
#define SERVICES_JS_SYSTEM_MOJO_RUNNER_DELEGATE_H_

#include <mojo/system/handle.h>

#include "base/macros.h"
#include "gin/modules/module_runner_delegate.h"

namespace mojo {
namespace js {

class MojoRunnerDelegate : public gin::ModuleRunnerDelegate {
 public:
  MojoRunnerDelegate();
  ~MojoRunnerDelegate() override;

  void Start(gin::Runner* runner, MojoHandle pipe, const std::string& module);

 private:
  // From ModuleRunnerDelegate:
  void UnhandledException(gin::ShellRunner* runner,
                          gin::TryCatch& try_catch) override;

  DISALLOW_COPY_AND_ASSIGN(MojoRunnerDelegate);
};

}  // namespace js
}  // namespace mojo

#endif  // SERVICES_JS_SYSTEM_MOJO_RUNNER_DELEGATE_H_
