
// Get user input synchronously
const a = 10;
const b = 20;

function arrFunc(){
    let arr = [];
    /*setting 'i' to equal to 'a' because that is the starting point of our range
    then we check if 'i' is the same size of 'b' because that means we have reached
    our max element in the range */
    for (let i = a; i<=b; i++) {
        arr.push(i);
    }
    return arr;    
}

function applicatorFunc(inpFunc, s){
    if(s=='s'){
        const arr = inpFunc();        
        let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
        return sum;
    }
    else{        
        const arr = inpFunc();
        let sum = arr.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
        return sum/arr.length;
    }
}

let x = applicatorFunc(arrFunc, 's');
console.log(x);