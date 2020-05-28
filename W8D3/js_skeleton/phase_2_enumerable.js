Array.prototype.myEach = function (funct) {
    for (let i = 0; i < this.length; i++ ) {
        funct(this[i]);
    }
};

const Numbers = [1,2,3,4]

function squaring(num) {
    return num * num;
};

Numbers.myEach(squaring);

Array.prototype.myMap = function (callback) {
    let newArray = [];
    // for (let i = 0; i < this.length ; i++ ) {
    //     newArray.push(callback(this[i]));
    // }
    this.myEach(ele => newArray.push(callback(ele)));
    return newArray;
};
console.log(Numbers.myMap(ele => ele + ele));

Array.prototype.myReduce = function (callback, initialValue) {

    if (initialValue === undefined) {
        initialValue = this[0];
        this.shift();
    }   

    let accumulator = initialValue;
    this.myEach(ele => accumulator = callback(accumulator, ele) );
    return accumulator;
};
console.log(Numbers.myReduce((acc, ele) => acc + ele));


console.log([1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
})); // => 6

// with initialValue
console.log([1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
}, 25)); // => 31