/* global bootstrap: false */
(() => {
  'use strict'
  const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.forEach(tooltipTriggerEl => {
    new bootstrap.Tooltip(tooltipTriggerEl)
  })
})()

var turn = document.getElementById('click')
var cl = document.getElementById('turn')
var i = 0;
turn.onclick = function(){

    if(cl.style.transform == "rotate(180deg)"){
      cl.style.transform = "rotate(0deg)";
    }
    else 
      cl.style.transform = "rotate(180deg)"
}
var margin = document.getElementById('mar')
var smargin = document.getElementById('smar')
var apply = document.getElementById('apply')
var disp = document.getElementById('open')
var non = document.getElementById('disp')

//$('#clas').clone().appendTo('#minus')



margin.onclick = function(){
  apply.style.display = "none"
  disp.style.display = "block"
  non.style.display = "none"
}
smargin.onclick = function(){
     apply.style.display = "block"
     disp.style.display = "none"
     non.style.display = "block"
   }

   document.querySelector('.dropdown-')
