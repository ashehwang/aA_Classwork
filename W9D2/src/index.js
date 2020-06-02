const MovingObject = require("./moving_object.js")
window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", function(){
    const canvasEl = document.getElementsByTagName("canvas")[0];
    canvasEl.width = 750;
    canvasEl.height = 500;

    const ctx = canvasEl.getContext("2d");

})