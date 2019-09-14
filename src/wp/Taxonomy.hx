package wp;

import wp.extern.TaxonomyApi;
import wp.extern.Taxonomy as WpTaxonomy;

@:forward
abstract Taxonomy(WpTaxonomy) from WpTaxonomy to WpTaxonomy {

  public inline function new(taxonomy:String, objectType, args)
    this = new WpTaxonomy(taxonomy, objectType, args);

  public inline function register()
    return TaxonomyApi.registerTaxonomy(this.name, this.objectType, cast this);

}
