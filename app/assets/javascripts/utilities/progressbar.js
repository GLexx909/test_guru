document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#test_show_progress');

  if (control) {
    var progressbar = document.querySelector('#test_show_progress');
    var currentNumber = document.querySelector('form').getAttribute('data-current-number');
    var totalCount = document.querySelector('form').getAttribute('data-total-count');

    progressbarEdit(currentNumber, totalCount)
   };

});

function progressbarEdit(currentNumber, totalCount){
  var currentPercent = (100/+totalCount)*(+currentNumber-1);
  var progressbar = document.querySelector('#test_show_progress');

  progressbar.style.cssText='width:' + currentPercent + '%';
  progressbar.innerHTML= + currentPercent + '%';

};
