package wp.core;

class Theme extends Component {

  public function new() {

  }

  @:on('init')
  public function registerPostTypes() {
    for (type in types) {
      type.register();
    }
  }

}
