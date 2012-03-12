<?php

class EditPagePropForm extends EditPagePropFormBase {

  public function __construct($pageId, $god) {
    $this->god = $god;
  	parent::__construct($pageId);
    $this->options['filterEmpties'] = true;
    $this->addVisibilityCondition('linkSection', 'module', 'v == "link"');
  }
  
  protected function _getFields() {
    $fields = array_merge(parent::_getFields(), array(
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
      ),
      array(
        'title' => 'Сделать главной страницей',
        'name' => 'home',
        'type' => 'boolCheckbox'
      )
    ));
    if ($this->god) {
      $fields[] = array(
        'title' => 'Модуль',
        'name' => 'module'
       );
      $fields[] = array(
        'type' => 'pageController',
        'name' => 'controller'
      );
    } else {
      $fields[] = array(
        'title' => 'Модуль',
        'name' => 'module',
        'type' => 'hidden'
      );
    }
    return $fields;
  }

}
