<?php

class NewModulePageForm extends NewModulePageFormBase {

  protected $allowAllModules = true;

  protected function init() {
    $this->addVisibilityCondition('typeSection', 'folderPageType', 'v != "empty"');
    $this->addVisibilityCondition('linkSection', 'module', 'v == "link"');
  }

  protected function _getFields() {
    $fields = parent::_getFields();
    return array_merge($fields, array(
      array(
        'name' => 'typeSection',
        'type' => 'headerVisibilityCondition'
      ),
      array(
        'name' => 'linkSection',
        'type' => 'headerVisibilityCondition'
      ),
      array(
        'title' => 'Ссылка',
        'name' => 'link',
        'type' => 'pageLink',
      ),
      array(
        'title' => 'Дополнительные параметры',
        'type' => 'headerToggle'
      ),
      array(
        'title' => 'Имя страницы',
        'help' => 'будет использоваться для формирования адреса страницы',
        'name' => 'name'
      ),
      array(
        'title' => 'Полный заголовок раздела',
        'help' => 'используется, если заголовок раздела на странице боле длинный, чем в меню',
        'name' => 'fullTitle'
      )
    ));
  }

}