part of compass;

class Layer extends InteractiveObject {
  List<DisplayObject> children = [];
  bool interactiveChildren = true;
  
  addChild(DisplayObject node) {
    node.removeFromParent();
    node.parent = this;
    children.add(node);
  }
  
  removeChild(DisplayObject node) {
    if(children.remove(node)){
      node.parent = null;
    }
  }
  
  removeChildren() {
    children.forEach((child) => child.parent = null);
    children.clear();
  }
  
  render(Renderer renderer) {
    if(visible)
      children.forEach((child) => child.render(renderer));
  }
  
  invalidate() {
    super.invalidate();
    children.forEach((child) => child.invalidate());
  }
}