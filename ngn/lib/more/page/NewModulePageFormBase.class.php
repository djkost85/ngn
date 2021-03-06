<?php

class NewModulePageFormBase extends Form {
  
  protected $pageId;
  protected $allowAllModules = false;
  
  public function __construct($pageId) {
    $this->pageId = $pageId;
    $this->options['submitTitle'] = 'Создать';
    parent::__construct(new Fields($this->_getFields()));
  }
  
  protected function _getFields() {
    return array(
      array(
        'title' => 'Тип раздела',
        'name' => 'module',
        'type' => 'select',
        'required' => true,
        'default' => 'content',
        'options' => array_merge(
          array('' => '— не задано —'),
          Arr::get(
            (Misc::isGod() and $this->allowAllModules) ?
              O::get('PageModules')->getItems() :
              O::get('PageModulesAllowed')->getItems()
          , 'title', 'KEY')
        )
      ),
      array(
        'title' => 'Название раздела',
        'name' => 'title',
        'required' => true
      ),
      array(
        'title' => 'Папка',
        'name' => 'folder',
        'type' => 'boolCheckbox'
      )
    );
  }
  
  protected function _update(array $data) {
    $data['parentId'] = $this->pageId;
    Pmi::get($data['module'])->install($data);
  }

}