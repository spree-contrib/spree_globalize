var root = typeof exports !== 'undefined' && exports !== null ? exports : this

root.taxon_tree_menu = function(obj, context) {
  var id = obj.attr('id')
  var admin_base_url = Spree.url(Spree.routes.admin_taxonomy_taxons_path)
  var edit_url = admin_base_url.clone()
  var translation_url = admin_base_url.clone()
  var translation_base_path = admin_base_url.path().replace(/taxons/, 'translations')
  translation_base_path = translation_base_path.replace(/taxonomies/, 'taxons')
  translation_base_path = translation_base_path.replace(/\d+/, id)
  edit_url.setPath(edit_url.path() + '/' + id + '/edit')
  translation_url.setPath(translation_base_path)
  return {
    create: {
      label: '<span class="icon icon-plus"></span> ' + Spree.translations.add,
      action: function(obj) {
        context.create(obj)
      }
    },
    rename: {
      label: '<span class="icon icon-pencil"></span> ' + Spree.translations.rename,
      action: function(obj) {
        context.rename(obj)
      }
    },
    remove: {
      label: '<span class="icon icon-trash"></span> ' + Spree.translations.remove,
      action: function(obj) {
        context.remove(obj)
      }
    },
    edit: {
      separator_before: true,
      label: '<span class="icon icon-cog"></span> ' + Spree.translations.edit,
      action: function() {
        window.location = edit_url.toString()
      }
    },
    translate: {
      separator_before: true,
      label: '<span class="icon icon-flag"></span> ' + Spree.translations.translations,
      action: function() {
        window.location = translation_url.toString()
      }
    }
  }
}
