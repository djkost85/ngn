<?php

class PbvTags extends PbvAbstract {

  /**
   * @var DdTagsTagsBase
   */
  public $oTags;
  
  protected function init() {
    $this->cssClass = 'pbSubMenu';
    if ($this->oPBM['settings']['hideSubLevels']) $this->cssClass .= ' hideSubLevels';
    $this->page = DbModelCore::get('pages', $this->oPBM['settings']['pageId']);
    $this->oTags = DdTags::get($this->page['strName'], $this->oPBM['settings']['tagField']);
  }

  public function _html() {
    $selectedIds = array();
    if (!empty($this->oCC) and !empty($this->oCC->d['tagsSelected'])) {
      $tagsSelected = DdTagsHtml::treeToList($this->oCC->d['tagsSelected']);
      if (DdCore::isItemsController($this->oCC->page['controller'])) {
        $selectedIds = Arr::get($tagsSelected, 'id');
      }
    }
    $html = '<div class="data">'.json_encode(array('groupId' => $this->oTags->getGroup()->id)).'</div>';
    $param = $this->oTags->getGroup()->isTree() ? 
      't2.`.$groupName.`.`.$id' : 't.`.$groupName.`.`.$name';
    $nodes = $this->oTags->getData();
    $dddd = '`<a href="'.$this->page['path'].'/'.$param.'.`"><i></i><span>`.$title.'.
           ($this->oPBM['settings']['showTagCounts'] ? '` <span>(`.$cnt.`)</span>' : '`').
           '</span></a>`';
    if ($this->oPBM['settings']['showOnlyLeafs'] and 0) {
      $html .= DdTagsHtml::treeOnlyNotEmptyLeafs($nodes, $dddd);
    } else {
      $html .= DdTagsHtml::treeUl(
        $nodes, 
        $dddd,
        $selectedIds,
        $this->oPBM['settings']['showNullCountTags']
      );
    }
    if (Misc::isAdmin())
      $this->js .= <<<JS
var block = Ngn.pageBlocks.blocks[{$this->oPBM['id']}];
block.replaceEditBlockBtn({
  name: 'tag2', title: 'Редактировать рубрики'
}, function() {
  new Ngn.Dialog.TreeEdit.Tags({
    blockId: {$this->oPBM['id']},
    data: JSON.decode(block.eBlock.getElement('.bcont').getElement('.data').get('html'))
  });
});
JS;
    if ($this->oPBM['settings']['hideSubLevels'])
      $this->js .= <<<JS
new Ngn.UlMenu($('block_{$this->oPBM['id']}').getElement('ul'));
JS;
    return $html;
  }
  
}