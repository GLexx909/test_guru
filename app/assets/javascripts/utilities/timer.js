document.addEventListener('turbolinks:load', function() {

  let button = document.querySelector('.result-button');
  let time = document.querySelector('.time');
  let span1 = document.querySelector('.timer__span1');
  let span2 = document.querySelector('.timer__span2');
  let span3 = document.querySelector('.timer__span3');
  let span4 = document.querySelector('.timer__span4');
  let next = document.querySelector('.next');

  if (button && time && span1 && span2 && span3 && span4 && next) {
    timer();
    next.onclick = function(){
      let timeArray = [span1.innerHTML, span2.innerHTML, span3.innerHTML, span4.innerHTML]
      setCookie("timeArray", JSON.stringify(timeArray));
    };

  }else{
    document.cookie = "timeArray=; expires=Mon, 05 Jul 1973 16:37:51 GMT; ";
    // Эта кука НЕ УДАЛЯЕТСЯ таким образом, гадина! Почему? Вернее запись годная, но не срабатывет.
    // А если вынести за if, по всё работает. Или если созать новый if и  условие задать (true), то всё работает
    // Хотел эту куку в Rails tTestPassagesController где нибудь удалить - тоже БОЛТ !!! Не удаляет.
    // И прикол, если Рельсах пытаюсь puts cookie[:timeArray], то выводит =>   ['0'     ,т.е. незакрытую часть массива куки!
  };

});

function timer(){


  let time = document.querySelector('.time');
  time = time.innerHTML.split('');

  const span1 = document.querySelector('.timer__span1');
  const span2 = document.querySelector('.timer__span2');
  const span3 = document.querySelector('.timer__span3');
  const span4 = document.querySelector('.timer__span4');


  if (getCookie('timeArray')) {
    var cookieTime = (JSON.parse(getCookie('timeArray')));
    span1.innerHTML = cookieTime[0];
    span2.innerHTML = cookieTime[1];
    span3.innerHTML = cookieTime[2];
    span4.innerHTML = cookieTime[3];
  }else{
    if(time[time.length - 2]) {span1.innerHTML = time[time.length - 2]};
    span2.innerHTML = time[time.length - 1];
    span3.innerHTML = 0;
    span4.innerHTML = 0;
  };


  function start_time(){

    span4.innerHTML = Number(span4.innerHTML) - 1;
    if (span4.innerHTML == -1) {
      span4.innerHTML = 9;
      span3.innerHTML = Number(span3.innerHTML) - 1;
    }

    if (span3.innerHTML == -1) {
      span3.innerHTML = 5;
      span2.innerHTML = Number(span2.innerHTML) - 1;
    }

    if (span2.innerHTML == -1) {
      span2.innerHTML = 9;
      span1.innerHTML = Number(span1.innerHTML) - 1;
    }

    if (span1.innerHTML == 0 && span2.innerHTML == 0 && span3.innerHTML == 0 && span4.innerHTML == 0) {
      let button = document.querySelector('.result-button');
      button.click();
    }

  }

  setInterval(start_time,1000);
  document.cookie = "timeArray=; expires=Mon, 05 Jul 1982 16:37:55 GMT; ";

};

function setCookie(name, value) {
  document.cookie = name + "=" + value;
};

function getCookie(name) {
  var r = document.cookie.match("(^|;) ?" + name + "=([^;]*)(;|$)");
  if (r) return r[2];
  else return "";
};
