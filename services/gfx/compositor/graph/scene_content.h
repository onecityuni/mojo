// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef SERVICES_GFX_COMPOSITOR_GRAPH_SCENE_CONTENT_H_
#define SERVICES_GFX_COMPOSITOR_GRAPH_SCENE_CONTENT_H_

#include <iosfwd>
#include <unordered_map>

#include "base/macros.h"
#include "base/memory/ref_counted.h"
#include "base/memory/weak_ptr.h"
#include "mojo/services/gfx/composition/interfaces/scenes.mojom.h"
#include "services/gfx/compositor/graph/node_def.h"
#include "services/gfx/compositor/graph/resource_def.h"
#include "services/gfx/compositor/graph/scene_label.h"

namespace compositor {

class SceneContentBuilder;
class SceneDef;

// Represents the content of a particular published version of a scene.
//
// Holds a resource and node table which describes the content of a
// scene as it was when a particular version was published.  Only the
// internal state of the scene is described; links to other scenes are
// not resolved at this level.
//
// Once fully constructed, instances of this class are immutable and
// reference counted so they may be bound to scene references in other scenes.
//
// TODO(jeffbrown): To improve efficiency, we could replace the hash tables
// with a vector of internally linked graph edges.  This is relatively easy
// since the traversal order is well-known and we could even build some kind
// of hierarchical iterator to walk the graph starting from the root.
class SceneContent : public base::RefCounted<SceneContent> {
 public:
  // Gets the scene label.
  const SceneLabel& label() const { return label_; }
  std::string FormattedLabel() const {
    return label_.FormattedLabelForVersion(version_);
  }
  std::string FormattedLabelForNode(uint32_t node_id) const {
    return label_.FormattedLabelForNode(version_, node_id);
  }

  // Gets the version of the scene represented by this object.
  uint32_t version() const { return version_; }

  // Gets the requested resource, never null because it must be present.
  const ResourceDef* GetResource(uint32_t resource_id,
                                 ResourceDef::Type resource_type) const;

  // Gets the requested node, never null because it must be present.
  const NodeDef* GetNode(uint32_t node_id) const;

  // Gets the root node if it exists, otherwise returns nullptr.
  const NodeDef* GetRootNodeIfExists() const;

 private:
  friend class base::RefCounted<SceneContent>;
  friend class SceneContentBuilder;
  SceneContent(const SceneLabel& label,
               uint32_t version,
               size_t max_resources,
               size_t max_nodes);
  ~SceneContent();

  const SceneLabel label_;
  const uint32_t version_;
  std::unordered_map<uint32_t, scoped_refptr<const ResourceDef>> resources_;
  std::unordered_map<uint32_t, scoped_refptr<const NodeDef>> nodes_;

  DISALLOW_COPY_AND_ASSIGN(SceneContent);
};

// Builds a table of all of the nodes and resources that make up the
// content of a particular version of a scene.
class SceneContentBuilder {
 public:
  SceneContentBuilder(const SceneDef* scene,
                      uint32_t version,
                      std::ostream& err,
                      size_t max_resources,
                      size_t max_nodes);
  ~SceneContentBuilder();

  // Stream for reporting validation error messages.
  std::ostream& err() { return err_; }

  // Ensures the requested resource is part of the retained scene graph and
  // returns a reference to it, or nullptr if an error occurred.
  const ResourceDef* RequireResource(uint32_t resource_id,
                                     ResourceDef::Type resource_type,
                                     uint32_t referrer_node_id);

  // Ensures the requested node is part of the retained scene graph and
  // returns a reference to it, or nullptr if an error occurred.
  const NodeDef* RequireNode(uint32_t node_id, uint32_t referrer_node_id);

  // Builds the content graph.
  // Returns nullptr if an error occurred.
  scoped_refptr<const SceneContent> Build();

 private:
  bool AddNode(const NodeDef* node);

  scoped_refptr<SceneContent> content_;
  const SceneDef* scene_;
  std::ostream& err_;
};

}  // namespace compositor

#endif  // SERVICES_GFX_COMPOSITOR_GRAPH_SCENE_CONTENT_H_