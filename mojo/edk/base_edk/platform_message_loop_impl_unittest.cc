// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "mojo/edk/base_edk/platform_message_loop_impl.h"

#include <memory>
#include <thread>
#include <vector>

#include "base/bind.h"
#include "base/callback.h"
#include "base/memory/scoped_ptr.h"
#include "base/message_loop/message_loop.h"
#include "base/message_loop/message_pump_default.h"
#include "mojo/edk/platform/task_runner.h"
#include "mojo/edk/platform/test_message_loop.h"
#include "mojo/edk/util/ref_ptr.h"
#include "testing/gtest/include/gtest/gtest.h"

using mojo::platform::TaskRunner;
using mojo::util::RefPtr;

namespace base_edk {
namespace {

// TODO(vtl): This should probably take a |Runnable&&| instead, but that doesn't
// work with |base::Bind()|.
template <typename Runnable>
void RunnableRunner(const Runnable& runnable) {
  runnable();
}

template <typename Runnable>
base::Closure ToClosure(Runnable&& runnable) {
  return base::Bind(&RunnableRunner<Runnable>, runnable);
}

TEST(PlatformMessageLoopImpl, Basic) {
  PlatformMessageLoopImpl message_loop;

  EXPECT_EQ(base::MessageLoop::TYPE_DEFAULT,
            message_loop.base_message_loop().type());

  RefPtr<TaskRunner> task_runner = message_loop.GetTaskRunner();
  EXPECT_TRUE(task_runner);

  // |GetTaskRunner()| should always return the same |TaskRunner()|.
  EXPECT_EQ(task_runner, message_loop.GetTaskRunner());

  std::vector<int> stuff;
  task_runner->PostTask(ToClosure([&stuff, &message_loop, &task_runner]() {
    EXPECT_TRUE(message_loop.IsRunningOnCurrentThread());
    stuff.push_back(1);
    task_runner->PostTask(ToClosure([&stuff]() { stuff.push_back(3); }));
    message_loop.QuitWhenIdle();
  }));
  task_runner->PostTask(ToClosure([&stuff]() { stuff.push_back(2); }));
  EXPECT_TRUE(stuff.empty());
  message_loop.Run();
  EXPECT_EQ(std::vector<int>({1, 2, 3}), stuff);

  stuff.clear();
  task_runner->PostTask(ToClosure([&stuff, &message_loop, &task_runner]() {
    EXPECT_TRUE(message_loop.IsRunningOnCurrentThread());
    stuff.push_back(4);
    task_runner->PostTask(ToClosure([&stuff]() { stuff.push_back(6); }));
  }));
  task_runner->PostTask(ToClosure([&stuff]() { stuff.push_back(5); }));
  message_loop.RunUntilIdle();
  EXPECT_EQ(std::vector<int>({4, 5, 6}), stuff);

  stuff.clear();
  task_runner->PostTask(ToClosure([&stuff, &message_loop, &task_runner]() {
    EXPECT_TRUE(message_loop.IsRunningOnCurrentThread());
    stuff.push_back(7);
    message_loop.QuitNow();
    task_runner->PostTask(ToClosure([&stuff]() { stuff.push_back(9); }));
  }));
  task_runner->PostTask(ToClosure([&stuff]() { stuff.push_back(8); }));
  message_loop.Run();
  EXPECT_EQ(std::vector<int>({7}), stuff);
  stuff.clear();
  message_loop.RunUntilIdle();
  EXPECT_EQ(std::vector<int>({8, 9}), stuff);

  stuff.clear();
  message_loop.RunUntilIdle();
  EXPECT_TRUE(stuff.empty());

  {
    std::thread other_thread([&message_loop]() {
      // |IsRunningOnCurrentThread()| may be called on any thread.
      EXPECT_FALSE(message_loop.IsRunningOnCurrentThread());
    });
    other_thread.join();
  }

  stuff.clear();
  task_runner->PostTask(ToClosure([&stuff, &message_loop, &task_runner]() {
    EXPECT_TRUE(message_loop.IsRunningOnCurrentThread());
    std::thread other_thread([&stuff, &message_loop, task_runner]() {
      EXPECT_FALSE(message_loop.IsRunningOnCurrentThread());
      EXPECT_EQ(task_runner, message_loop.GetTaskRunner());
      stuff.push_back(10);
      task_runner->PostTask(ToClosure([&stuff, &message_loop]() {
        EXPECT_TRUE(message_loop.IsRunningOnCurrentThread());
        stuff.push_back(11);
        message_loop.QuitWhenIdle();
      }));
    });
    other_thread.join();
    EXPECT_EQ(std::vector<int>({10}), stuff);
    stuff.clear();
  }));
  message_loop.Run();
  EXPECT_EQ(std::vector<int>({11}), stuff);
}

TEST(PlatformMessageLoopImpl, TypeIO) {
  PlatformMessageLoopImpl message_loop(base::MessageLoop::TYPE_IO);

  EXPECT_EQ(base::MessageLoop::TYPE_IO,
            message_loop.base_message_loop().type());

  RefPtr<TaskRunner> task_runner = message_loop.GetTaskRunner();
  EXPECT_TRUE(task_runner);

  bool was_run = false;
  task_runner->PostTask(ToClosure([&was_run]() { was_run = true; }));
  EXPECT_FALSE(was_run);
  message_loop.RunUntilIdle();
  EXPECT_TRUE(was_run);
}

TEST(PlatformMessageLoopImpl, TypeCustom) {
  PlatformMessageLoopImpl message_loop(
      make_scoped_ptr(new base::MessagePumpDefault()));

  EXPECT_EQ(base::MessageLoop::TYPE_CUSTOM,
            message_loop.base_message_loop().type());

  RefPtr<TaskRunner> task_runner = message_loop.GetTaskRunner();
  EXPECT_TRUE(task_runner);

  bool was_run = false;
  task_runner->PostTask(ToClosure([&was_run]() { was_run = true; }));
  EXPECT_FALSE(was_run);
  message_loop.RunUntilIdle();
  EXPECT_TRUE(was_run);
}

// TODO(vtl): This test doesn't really belong here, but it's convenient. (Maybe
// it should actually be in a test in //mojo/edk/platform?)
TEST(PlatformMessageLoopImpl, CreateTestMessageLoop) {
  std::unique_ptr<mojo::platform::MessageLoop> message_loop =
      mojo::platform::test::CreateTestMessageLoop();

  bool was_run = false;
  message_loop->GetTaskRunner()->PostTask(
      ToClosure([&was_run]() { was_run = true; }));
  EXPECT_FALSE(was_run);
  message_loop->RunUntilIdle();
  EXPECT_TRUE(was_run);
}

}  // namespace
}  // namespace base_edk