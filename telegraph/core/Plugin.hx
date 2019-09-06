package wp.core;

class Plugin extends Component {

  public function new() {}

  @:on('init')
  public function registerPostTypes() {
    for (type in types) {
      type.register();
    }
  }

}