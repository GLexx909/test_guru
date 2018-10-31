document.addEventListener('turbolinks:load', function() {

  var time = document.querySelector('.time');

  if (time) {
    timer();
  }

});

function timer(){

  var time = document.querySelector('.time').innerHTML;

  var minutes = document.querySelector('.timer__minutes');
  var seconds = document.querySelector('.timer__seconds');

  function starTimer(){
    minInSec = Math.floor(time/60)
    minutes.innerHTML = minInSec
    seconds.innerHTML = time - (minInSec*60)

    time--

    if (time < 0) {
      clearInterval(timerId);
      var button = document.querySelector('.next');
      button.click();
    }

  };

  starTimer();

  var timerId = setInterval(starTimer,1000);

  var break_test = document.querySelector('.break_test');
  break_test.onclick = function(){
    clearInterval(timerId);
  }
}
