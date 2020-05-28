Array.prototype.uniq = function() {
    let newArray = [];

    for (let i = 0; i < this.length; i++) {
        if (newArray.indexOf(this[i]) === -1) {
            newArray.push(this[i]);
        }
    }

    return newArray;
};

console.log([1,2,3,3,4,4,5,6,8,8].uniq());

Array.prototype.twosum = function () {
    let newArray = [];

    for (let i = 0 ; i < this.length; i++){
        for (let j = (i + 1) ; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                newArray.push([i,j]);
            }
        }
    }

    return newArray;
};

console.log([1, 2, 3, -3, -4, 4, 3, 5, 6, 8, -8].twosum());

Array.prototype.transpose = function () {
    let newArray = [];

    for(var i = 0; i < this[0].length; i++){
        newArray.push([])
    };

    for(var i = 0; i < this.length; i++){
        for(var j = 0; j < this[0].length; j++){
            newArray[j].push(this[i][j])
        }
    }

    return newArray;
};

console.log([[2, 3], [3, 6], [4, 5]].transpose());
