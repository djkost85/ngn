<?php

class FieldECheckbox extends FieldEInput {

  public $inputType = 'checkbox';
  
  public function _html() {
    $input = '';
    $i = 0;
    foreach ($this->options['options'] as $key => $value) {
      $input .= '<span class="'.$this->inputType.(' opt_'.Misc::name2id($key)).'">'.
                '<input type="'.$this->inputType.'"'.
                ' name="'.$this->options['name'].
($this->inputType == 'checkbox' and count($this->options['options']) > 1 ? '[]' : '')
                .'" id="'.$this->options['id'].Misc::name2id($key).'"';
      // Name have to be an array when using multiple checkboxes.
      $input .= ' value="'.$key.'"';
      // This works for a single value too; it will be casted to an array.
      if (in_array($key, (array)$this->options['value']))
        $input .= ' checked="checked"';
      $input .= ' />';
      //if (!empty($this->options['value'])) {
        $input .= '<label for="'.$this->options['id'].Misc::name2id($key).'"'.
                  '>'.$value."</label></span>";
      //}
      $i++;
    }
    $input .= '<div class="clear"><!-- --></div>';
    return $input;
  }
  
}