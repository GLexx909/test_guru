document.addEventListener('turbolinks:load', function() {
  var pass_control = document.querySelector('#pass');
  var passConfirm_control = document.querySelector('#pass_confirm');

  if (pass_control && passConfirm_control) { passConfirm_control.addEventListener('keypress', comparePasses) };
});

function passConfValueDefinition(event) {
  var pass_conf = document.querySelector('#pass_confirm').value;

  return pass_conf = pass_conf + String.fromCharCode(event.keyCode);
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
