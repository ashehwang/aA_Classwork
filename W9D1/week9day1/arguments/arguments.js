
// function sum() {
//     let sum = 0;

//     for (let i = 0; i < arguments.length; i++) {
//         sum += arguments[i];
//     }

//     return sum;
// }

// console.log(sum(1, 2, 3, 4) === 11);

// function sum2(...args){
//     let sum = 0;
//     args.forEach(el => sum += el);
//     return sum;
// }

// console.log(sum2(1, 2, 3, 4));

// Function.prototype.myBind = function (ctx){ //ctx = pavlov
//     const that = this; 
//     const bindingArguments = Array.from(arguments).slice(1); //bindingargs = []
//     return function (){
//         const callArguments = Array.from(arguments); //[meow, tree]
//         return that.apply(ctx, bindingArguments.concat(callArguments));
//     }
// }

Function.prototype.myBind = function (ctx, ...bindArgs) { //ctx = pavlov
    const that = this;
    return function (...callArgs) {
        return that.apply(ctx, bindArgs.concat(callArgs));
    }
}
// markov.says.myBind(pavlov)("meow", "a tree");


class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

function curriedSum(numArgs){
    const numbers = [];

    return _curriedSum = function(num){
        numbers.push(num);
        if (numbers.length === numArgs){
            return numbers.reduce((acc, el) => acc += el);
        }
        return _curriedSum;
    }
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1));

Function.prototype.curry = function(numArgs) {
    const args = [];
    const that = this;
    function _curriedFunction(arg){
        args.push(arg);
        if (args.length === numArgs) {
            return that.apply(null, args);
        } else {
            return _curriedFunction;
        }
    }
    return _curriedFunction;
}

Function.prototype.curry = function (numArgs) {
    const args = [];
    // const that = this;
    const tikkaMasala = (arg) => {
        args.push(arg);
        if (args.length === numArgs) {
            return this(...args);
        } else {
            return tikkaMasala;
        }
    }
    return tikkaMasala;
}

function sum() {
    let sum = 0;

    for (let i = 0; i < arguments.length; i++){
        sum += arguments[i];
    }

    return sum;
}

const ourSum = sum.curry(3);
console.log(ourSum(1)(2)(3));