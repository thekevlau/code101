//Specifically, it will check the text for the first letter of your name, 
//then push (add) the number of characters equal to your name's length to an array. 
//By inspecting the array, you'll be able to see if your name was mentioned!

/*jshint multistr:true */

var text = "Hey, Klement how are you \
doing? Kere My name is Kevin. Karina Kalvin";
var hits = [];

for (var i=0; i<text.length; i++){
    if (text[i] == "K") {
        while (text[i] != " ") {
            hits.push(text[i]);
            i++;
        }
        if (hits.length === 0) {
        	console.log("Your name wasn't found!");
    	} else {
        	console.log(hits);
    	}
    }
}
