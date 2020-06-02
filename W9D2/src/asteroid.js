const Util = require("./util");
const MovingObject = require("./moving_object");

const DEFAULTS = {
    COLOR: "#505050",
    RADIUS: 25,
    SPEED: 4
};

Util.inherits(Asteroid, MovingObject);

function Asteroid(options) {
    options = options || {};
    options.color = DEFAULTS.COLOR;
    options.pos = options.pos || options.game.randomPosition();
    option.radius = DEFAULTS.RADIUS;
    options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);

    MovingObject.call(this, options);
}

module.exports = Asteroids;