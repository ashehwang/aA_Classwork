Array.prototype.bubbleSort = function () {
    let sorted = false;

    while (!sorted) {
        sorted = true;

        for (let i = 0; i < (this.length - 1); i++) {
            if (this[i] > this[i+1]) {
                // [this[i], this[i+1]] = [this[i+1], this[i]]; but why??
                let tempI = this[i]
                let tempJ = this[i+1]
                this[i] = tempJ
                this[i+1] = tempI
                sorted = false;
            }
        }
    }
    return this;
};

console.log([4, 7, 9, 3, 1, 4, 8].bubbleSort());

String.prototype.substrings = function () {
    let substrings = []
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j <= this.length ; j++ ) {
            substrings.push(this.slice(i,j));
        }
    }
    return substrings
};

// Array.prototype.slice([start, [end]])
// Makes a copy of an array from the start index up to 
// but not including the end index.Both arguments are 
// optional(the first and last elements are used by default ).

console.log("abcdef".substrings());