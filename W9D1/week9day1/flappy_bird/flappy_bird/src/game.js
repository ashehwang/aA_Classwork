import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    debugger
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.restart();
  }

  animate() {
    debugger
    this.level.animate(this.ctx);
  }

  restart() {
    debugger
    this.level = new Level(this.dimensions);
    this.animate();
  }
}