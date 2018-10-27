document.addEventListener('turbolinks:load', function() {

  let button = document.querySelector('.result-button');
  let time = document.querySelector('.time');
  let minutes = document.querySelector('.timer__minutes');
  let seconds = document.querySelector('.timer__seconds');
  let next = document.querySelector('.next');

  if (button && time && minutes && seconds && next) {
    timer();
  }else{
    document.cookie = "timeArray=; expires=Mon, 05 Jul 1973 16:37:51 GMT; ";
  }


});

function timer(){
  if (getCookie('timeArray')){
    var time = getCookie('timeArray')
  }else{
    var time = document.querySelector('.time').innerHTML;
    if (time.length < 3) {
      let timeHide = document.querySelector('.time')
      timeHide.innerHTML = getCookie('timeArray')
    }

  }

  let minutes = document.querySelector('.timer__minutes');
  let seconds = document.querySelector('.timer__seconds');


  function start_time(){

    minInSec = Math.floor(time/60)
    minutes.innerHTML = minInSec
    seconds.innerHTML = time - (minInSec)*60

    time--

    setCookie('timeArray', time)

    let timeHide = document.querySelector('.time')
    timeHide.innerHTML = time

    if (time == 0) {
      document.cookie = "timeArray=; expires=Mon, 05 Jul 1973 16:37:51 GMT; ";
      clearInterval(timerId);
      let button = document.querySelector('.result-button');
      button.click();
    }

  }

  var timerId = setInterval(start_time,1000);

}

function setCookie(name, value) {
  document.cookie = name + "=" + value;
};

function getCookie(name) {
  var r = document.cookie.match("(^|;) ?" + name + "=([^;]*)(;|$)");
  if (r) return r[2];
  else return "";
};
