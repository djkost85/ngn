<?php

class FieldEImagedRadio extends FieldERadio {

  public function _js() {
    return "
$('{$this->oForm->id}').getElements('.type_{$this->type}').each(function(el) {
  Ngn.frm.imagedRadio(el);
});
    ";
  }

}
