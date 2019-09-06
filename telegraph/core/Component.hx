package wp.core;

import wp.PostType;

@:autoBuild(wp.core.macro.ComponentBuilder.build())
class Component {

  private var subComponents:Array<Component> = [];
  private var types:Array<PostType> = [];
  private var registered:Bool = false;

  public function isRegistered() {
    return registered;
  }

  public function register() {
    // noop
  }

  public function addComponent(component:Component) {
    subComponents.push(component);
    return this;
  }

  public function addPostType(type:PostType) {
    types.push(type);
    return this;
  }

  public function run() {
    for (component in subComponents) {
      if (component.isRegistered() == false) component.register();
    }
  }

}