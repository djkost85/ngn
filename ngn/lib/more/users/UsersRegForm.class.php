<?php

class UsersRegForm extends Form {
  
  protected $subscribeOnReg;
  
  protected $mysite;
  
  protected function defineOptions() {
    parent::defineOptions();
    $this->options = array_merge($this->options, array(
      'id' => 'frmUserReg',
      'submitTitle' => 'Зарегистрироваться',
      'subscribeOnReg' => true,
      'active' => !(bool)Config::getVarVar('userReg', 'activation')
    ));
  }
  
  public function __construct(array $options = array()) {
    $this->setOptions($options);
    $this->initMysite();
    $this->initRole();
    $this->initSubscribe();
    parent::__construct(new Fields($this->_getFields()));
    $this->initErrors();
    $this->setEquality('rules', 1);
    $this->setActionFieldValue('');
    $this->setFieldsEquality('pass', 'pass2');
  }
  
  protected function _getFields() {
    $fields = array();
    $fields[] = UserRegCore::getLoginField();
    $fields[] = array(
      'name' => 'pass',
      'title' => 'Пароль',
      'type' => 'password',
      'required' => true
    );
    $fields[] = array(
      'name' => 'pass2',
      'title' => 'Пароль ещё раз',
      'type' => 'password2',
      'required' => true
    );
    if (Config::getVarVar('userReg', 'emailEnable')) {
      $fields[] = array(
        'name' => 'email',
        'title' => 'E-mail',
        'type' => 'email',
        'required' => true
      );
    }
    if (Config::getVarVar('userReg', 'phoneEnable')) {
      $fields[] = array(
        'name' => 'phone',
        'title' => 'Телефон',
        'type' => 'phone',
        'required' => true
      );
    }
    return $fields;
  }

  /**
   * Создание пользователя
   *
   * @param array $data
   */
  protected function _update(array $data) {
    $data['active'] = $this->options['active'];
    $id = DbModelCore::create('users', $data);
    Ngn::fireEvent('users.register', $id);
    $this->afterUserUpdate($id, $data);
  }
  
  protected function afterUserUpdate($userId, array $data) {
    if ($this->subscribeOnReg and isset($data['subsList'])) {
      foreach ($data['subsList'] as $listId => $subscribed) {
        if (!$subscribed) continue;
        db()->query('REPLACE INTO subs_users SET userId=?d, listId=?d',
          $userId, $listId);
      }
    }
  }
  
  protected function initErrors() {
    if (!$this->isSubmitted()) return;
    // Дополнительные проверки
    $el = $this->getElement('email');
    if (DbModelCore::get('users', $el->value(), 'email')) {
      $el->error('Такой имейл уже зарегистрирован');
    }
    $el = $this->getElement('login');
    if (DbModelCore::get('users', $el->value(), 'login')) {
      if (Config::getVarVar('userReg', 'loginAsFullName'))
        $el->error('Такое Ф.И.О. уже зарегистрировано');
      else
        $el->error('Такой логин уже зарегистрирован');
    }
    if ($this->mysite) {
      $el = $this->getElement('name');
      if ($el->valueChanged and DbModelCore::get('users', $el->value(), 'name')) {
        $el->error('Такой домен уже зарегистрирован');
      }
    }
  }
  
  protected function initMysite() {
    $this->mysite = Config::getVarVar('mysite', 'enable');
    if (!$this->mysite) return;
    $this->fields[] = array(
      'name' => 'name',
      'title' => 'Домен',
      'type' => 'name',
      'required' => true
    );
  }
  
  protected function initRole() {
    if (Config::getVarVar('role', 'enable', true))
      $this->fields = Arr::append(array($this->getRoleField()), $this->fields);
  }
  
  protected function getRoleField() {
    return array(
      'title' => 'Тип профиля',
      'name' => 'role',
      'type' => 'userRole'
    );
  }
  
  protected function initSubscribe() {
    $this->subscribeOnReg = 
      (!empty($this->options['subscribeOnReg']) and Config::getVarVar('subscribe', 'onReg'));
    if (!$this->subscribeOnReg) return;
    $subscribes = db()->query('SELECT id, title FROM subs_list WHERE active=1 AND useUsers=1');
    if (!$subscribes) return;
    $this->fields[] = array(
      'name' => 'subscribes',
      'title' => Config::getVarVar('subscribe', 'regHeaderTitle'),
      'type' => 'header'
    );
    foreach ($subscribes as $v) {
      $this->fields[] = array(
        'name' => 'subsList['.$v['id'].']',
        'title' => $v['title'],
        'type' => 'bool',
        'default' => true
      );
    }
  }
  
}