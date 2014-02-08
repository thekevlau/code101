function userChoice
userChoice = prompt("Rock, Paper or Scizzors?");
if (userChoice != "Rock" || "Paper" || "Scissors") {
    console.log("inappropriate input. try again!");

}

console.log("Your choice is: " + userChoice);

computerChoice = Math.random();
console.log(computerChoice);
if (computerChoice < 0.33) {
    computerChoice = "Rock";
}
//an error here....else if implies the previous if condition, so the 0.33 is redundant 
else if (0.33 < computerChoice < 0.67) {
    computerChoice = "Paper";
}
else {
    computerChoice = "Scissors";
}


function compare (userInput, compInput){
    if (userInput == "Rock") {
        if (compInput == "Rock") {
            console.log("Tie!");
            result = 0;
        }
        
        if (compInput == "Paper") {
            console.log("Lose!");
            compScore += 1; 
        }

        if (compInput == )
    }
    
}