window.addEvent('domready', function() {
  var btnShowHiddenPrices = $('btnShowHiddenPrices');
  if (btnShowHiddenPrices) btnShowHiddenPrices.addEvent('click', function(e) {
    e.preventDefault();
    new Ngn.Dialog.Confirm({
      message: 'Для того, что бы узнать оптовые цены вам необходимо зарегистрироваться',
      onOkClose: function() {
        var dialog = new Ngn.Dialog.Auth();
        dialog.addEvent('activation', function() {
      	  Ngn.Dialog.openWhenClosed(dialog, Ngn.Dialog.Msg, {
            message: 'Вы отправили заявку на регистрацию. Скоро с вами свяжется менеджер'
          });
        });
      }
    });
  });
});