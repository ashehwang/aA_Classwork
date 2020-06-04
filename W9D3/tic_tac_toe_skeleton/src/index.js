const View = require('./ttt-view.js');
const Game = require('../ttt_node/game.js');

  $( () => {
    const game = new Game();
    const ttt = $('.ttt');
    new View(game, ttt);
  });