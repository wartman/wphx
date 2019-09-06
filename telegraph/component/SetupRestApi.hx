package wp.component;

import wp.core.Component;
import wp.api.RestApi;
import wp.api.AssetsApi;

using wp.api.Util;

class SetupRestApi extends Component {

  public var restUrl:String;

  public function new() {
    restUrl = RestApi.getRestUrl().escUrlRaw();
  }

  @:on('wp_enqueue_scripts')
  public function enqueue() {
    AssetsApi.localizeScript('wp-api', 'WP_API_SETTINGS', {
      root: restUrl,
      // nonce: Wp.createNonce('wp_rest') 
    });
  }

}
