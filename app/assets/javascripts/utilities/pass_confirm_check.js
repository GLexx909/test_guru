document.addEventListener('turbolinks:load', function() {
  var passControl = document.querySelector('#pass');
  var passConfirmControl = document.querySelector('#pass_confirm');

  if (passControl && passConfirmControl) { passConfirmControl.addEventListener('keypress', comparePasses) };
});

function passConfValueDefinition(event) {
  var passConfirm = document.querySelector('#pass_confirm').value;

  return passConfirm = passConfirm + String.fromCharCode(event.keyCode);
};

function comparePasses() {
  var pass = document.querySelector('#pass').value;
  var passConf = passConfValueDefinition(event);


  checkClass = document.querySelector('.octicon-check').classList;
  circleSlash = document.querySelector('.octicon-circle-slash').classList;

  if (pass == passConf) {
     checkClass.remove('hide');
     circleSlash.add('hide');
   } else {
     checkClass.add('hide');
     circleSlash.remove('hide');
   };
};
