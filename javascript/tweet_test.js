//the idea is to check if, of the people tagged in a given tweet, which of those people am I following


var following = new Array("beaker", "randomperson", "hello");
var tweet = 'Speaking of which, it would be hilarious if Twitter added a "@beaker would like to recall the tweet" option @kennwhite @kylemaxwell';
//iterate through the tweet and when you find an "@" sign, record the name until you hit another space
//store this in an array

//first extract the "people" in the tweet
var index = 0;
var array = [];
//this assumes that the variable i is the same within both loops....perhaps it is not the case
var i = 0
for (i; i < tweet.length; i++){
	if (tweet.charAt(i) == '@') {
		console.log("FOUND AN AT SIGN");
		console.log(i);
		for (i; tweet.charAt(i) != ' '; ++i) {
			var string;
			string += tweet.charAt(i);
			console.log(string);
		}
	array[index] = string;
	index = index+1;
	string = "";
	}

}


