const prompt=require("prompt-sync")({sigint:true}); 

const Error_enumobj = {
	FP_ROUNDING: "FP_ROUNDING",
	FP_OVERFLOW: "FP_OVERFLOW",
	FP_UNDERFLOW: "FP_UNDERFLOW",
	INT_OVERFLOW: "INT_OVERFLOW"
}

const Result_enumobj = {
    A_BIT_DIFFERENT: "A_BIT_DIFFERENT", 
    INFINITY: "INFINITY", 
    ZERO: "ZERO", 
    VERY_DIFFERENT: "VERY_DIFFERENT"
}

function error2Result(err){
    switch (err) {
	case Error_enumobj.FP_ROUNDING:
	 return Result_enumobj.A_BIT_DIFFERENT;
	break;
	case Error_enumobj.FP_OVERFLOW:
	    return Result_enumobj.INFINITY;
	break;
	case Error_enumobj.FP_UNDERFLOW:
	    return Result_enumobj.ZERO;
	break;
	case Error_enumobj.INT_OVERFLOW:
	    return Result_enumobj.VERY_DIFFERENT;
	break;
	default:
		return 'Invalid Error value';
}

}
/*
as you can see here line 39 is where a symbol is converted to a string this is because
Object.values(Error_enumobj) retrives the array of values from Error_enumobj, because these
values are already strings no explicit conversion is needed console.log automatically formats the
array into a readable string, the main reasson javascript doesnt has to convert anything really is 
because javascript uses plain obkects with string values which means no conversion is needed unlike java
enums are not strings they are special objects.
 */
console.log('Error list: ', Object.values(Error_enumobj));
var validArg = false;
while(!validArg){
    var input = prompt("Input: ");
    let result = error2Result(input);
    if (Object.values(Result_enumobj).includes(result)){
        validArg = true;
		console.log(input + " results in " + error2Result(input));
    }
    else{
        console.log(result);
    }
}
