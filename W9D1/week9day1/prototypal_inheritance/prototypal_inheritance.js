// Function.prototype.inherits = function (parent) {
//     // const Surrogate = function () {};
//     function Surrogate(){};
//     Surrogate.prototype = parent.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// }

Function.prototype.inherits = function (parent) {
    this.prototype = Object.create(parent.prototype);
    this.prototype.constructor = this;
}

function MovingObject(name) {
    this.name = name;
}

MovingObject.prototype.start = function(){
    console.log(`let's keep rolling, ${this.name}`);
}

function Ship(name, crew) {
    this.name = name;
    this.crew = crew;
}

Ship.inherits(MovingObject);

Ship.prototype.titanic = function() {
    console.log(`${this.crew}, I'm flying!`);
}


ship = new Ship('Titanic', 'Jack');
ship.start();
ship.titanic();

function Asteroid() { }
Asteroid.inherits(MovingObject);