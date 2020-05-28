// function range(start, end) {
//     if (start === end) {
//         return [];
//     }

// }

function sumRec(arr) {
    if (arr.length === 0) {
        return 0;
    };

    let ele = arr.pop();
    return ele + sumRec(arr);
}

console.log(sumRec([6,2,7]))

function exponent(base, exp) {
    if (exp === 0) {
        return 1;
    };

    return (base * exponent(base, exp - 1));

}

console.log(exponent(2, 5));


function fibonacci(n) {
    if (n===1) {
        return [1];
    }
    if (n===2) {
        return [1, 1];
    }
    let fibvar = fibonacci(n-1);
    let last = fibvar[fibvar.length - 1];
    let secondlast = fibvar[fibvar.length - 2];

    fibvar.push(last + secondlast); //cant return push? ex: return fibvar.push(last + secondlast);
    return fibvar
}

console.log(fibonacci(5));

function deepdup(arr) {
    copyArr = []
    
    for (let i = 0; i < arr.length; i++ ){
        if (arr[i].isArray) {
            copyArr.push(deepdup(arr[i]));
        } else {
            copyArr.push(arr[i]);
        }
    }
    return copyArr;
}

console.log(deepdup([1,2,[4,5,3,5], [[55]], 9]));