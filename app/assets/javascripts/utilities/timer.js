document.addEventListener('turbolinks:load', function() {

  let button = document.querySelector('.result-button');
  let time = document.querySelector('.time');
  let minutes = document.querySelector('.timer__minutes');
  let seconds = document.querySelector('.timer__seconds');
  let break_test = document.querySelector('.break_test');

  // Определяем, является ли вьюха нужной, иначе отчищаем счётчик.
  if (button && time && minutes && seconds && break_test) {
    timer();
  }else{
    localStorage.removeItem("timer")
  }

});

function timer(){

  // Если это продолжение теста, данные берутся из ЛС
  if (localStorage.getItem('timer')){
    var time = localStorage.getItem('timer')
  }else{
    // Если это вновь запущенный тест, берём данные времени из вьюхи
    var time = document.querySelector('.time').innerHTML*60;
  }

  let minutes = document.querySelector('.timer__minutes');
  let seconds = document.querySelector('.timer__seconds');
  // Сам таймер
  function start_time(){
    minInSec = Math.floor(time/60)
    minutes.innerHTML = minInSec
    seconds.innerHTML = time - (minInSec*60)

    time--
    localStorage.setItem('timer', time)
    // Если время истекло
    if (time == 0) {
      localStorage.removeItem("timer")
      clearInterval(timerId);
      let button = document.querySelector('.result-button');
      button.click();
    }

  }

  var timerId = setInterval(start_time,1000);

  // Если тест прерывается - останавливаем счётчик
  let break_test = document.querySelector('.break_test');
  break_test.onclick = function(){
    clearInterval(timerId);
  }
}
