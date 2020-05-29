let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */

// new Array(num) >> n sized array with empty values 
function _makeGrid () {
  let grid = new Array(8);
  
  for (let i = 0; i < 8; i++) {
    grid[i] = new Array(8);
  }

  grid[3][3] = new Piece("white");
  grid[3][4] = new Piece("black");
  grid[4][4] = new Piece("white");
  grid[4][3] = new Piece("black");

  return grid
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) { //btw 0,0 and 7,7
  return (pos[0] >= 0 && pos[0] < 8 && pos[1] >= 0 && pos[1] < 8);
};
 
/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw Error ("Invalid position");
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  return piece && piece.color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!this.getPiece(pos);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  if (!this.isValidPos(pos)) {
    return [];
  }
  
  if (!piecesToFlip) {
    piecesToFlip = [];
  }
  let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];

  if (!this.isValidPos(nextPos)){
    return [];
  } else if (!this.isOccupied(nextPos)) {
    return [];
  } else if (this.grid[nextPos[0]][nextPos[1]].color === color) {
    return piecesToFlip.length === 0 ? [] : piecesToFlip; // returned accumulated
  } else {
    piecesToFlip.push(nextPos);
    // piecesToFlip.push(pieceInQuestion);
    return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }

  // const outPut = Board.DIRS.forEach((dir) => {
  //   if (this._positionsToFlip(pos, color, dir)) {
  //     return true;
  //   }
  // });
  
  for (let i = 0; i < 8 ; i++)  {
    let outPut = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (outPut.length !== 0) {
      return true;
    } 
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)){
    throw Error('Invalid Move');
  }
  
  this.grid[pos[0]][pos[1]] = new Piece(color);

  let allPosToFlip = [];

  for (let i = 0; i < 8 ; i++)  {
    let outPut = this._positionsToFlip(pos, color, Board.DIRS[i]);
    // allPosToFlip.concat(outPut);
    allPosToFlip = allPosToFlip.concat(outPut);
  }


  // allPosToFlip.forEach(pos => {
  //   let piece = this.grid.getPiece(pos);
  //   piece.flip();
  // });
  for (let i = 0; i < allPosToFlip.length; i++) {
    this.getPiece(allPosToFlip[i]).flip();
  }

  // let board = this.grid;
  // allPosToFlip.forEach(pos => { board.getPiece(pos).flip })
  // call _positionsToFlip so we can flip each piece at a given coord
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.board
 */
Board.prototype.validMoves = function (color) {
  let validMovesArray = [];

  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      if (this.validMove([i, j], color)) {
        validMovesArray.push([i, j]);
      }
    }
  }
  return validMovesArray;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return (this.validMoves(color).length !== 0);
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("white") && !this.hasMove("black");
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  // make baseline
  let baseline = '________________________________';

  // print each row
  for (let i = 0; i < 8; i++) {
    let eachRow = ""
    for (let j = 0; j < 8; j++) {
      eachRow = eachRow + ' | ' + ((this.getPiece([i,j])) ? this.getPiece([i,j]).toString() : " ");
    }
    console.log(eachRow);
    console.log(baseline);
  }

};



module.exports = Board;
