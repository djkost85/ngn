Ngn.TreeEdit.Pages.site = new Class({
  Extends: Ngn.TreeEdit.Pages,
  
  add: function() {
    new Ngn.Dialog.NewModulePageSimple({
      pageId: this.tree.selected.data.id,
      onSubmitSuccess: function() {
        this.fireEvent('update');
      }.bind(this)
    });
  }
  
});
