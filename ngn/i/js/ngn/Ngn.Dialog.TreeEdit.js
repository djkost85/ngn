Ngn.Dialog.TreeEdit = new Class({
  Extends: Ngn.Dialog,
  Implements: [Ngn.Dialog.BlockEdit.Dynamic],
  
  options: {
    //id: unical,
    footer: false,
    width: 400,
    dialogClass: 'dialog treeDialog',
    bindBuildMessageFunction: true,
    resizeble: Ngn.Dialog.TreeResizeble,
    resizeble2: Ngn.Dialog.TreeResizeble
  }
  
});
