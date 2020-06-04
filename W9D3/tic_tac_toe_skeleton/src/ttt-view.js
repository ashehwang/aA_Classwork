class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", ( (event) => {
      let $square = $(event.currentTarget);
      this.makeMove($square);
    }));
  }

  makeMove($square) {
    const pos = $square.data("pos");
    const currentPlayer = this.game.currentPlayer;
    this.game.playMove(pos)
    $square.addClass(currentPlayer)
    if (this.game.isOver()){
      $('li').addClass('game-over');
      if (this.game.winner()) {
        const $p = $("<p>")
        $p.html("Congrats, you won!!");
        this.$el.append($p);
      } else {
        const $p = $("<p>")
        $p.html("It's a draw!!");
        this.$el.append($p);
      }
    }
  }


  setupBoard() {
    const $ul= $("<ul>");
    for (let i = 0; i < 3 ; i++ ) {
      for (let j = 0 ; j < 3 ; j++ ){
        const $li =$("<li>");
        $li.data("pos", [i, j]);
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }

}

module.exports = View;
