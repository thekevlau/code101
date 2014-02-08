var following = new Array(beaker, randomperson, hello);
var tweet = 'Speaking of which, it would be hilarious if Twitter added a "@beaker would like to recall the tweet" option @kennwhite @kylemaxwell';
//iterate through the tweet and when you find an "@" sign, record the name until you hit another space
//store this in an array

var index = 0;
var array = new Array();
for (var i = 0; i < tweet.length; i++){
	if (tweet.charAt(i) == '@') {
		for (tweet; tweet.charAt(i) != " "; i++) {
			var string = "";
			string += tweet.charAt(i);
		}
	console.log(string);
	var array[index] = string;
	index++;
	}

}

console.log("The people tagged in this are: ");
for (var i = 0; i<array.length; i++) {
	console.log(array[i] + '\n');
}

