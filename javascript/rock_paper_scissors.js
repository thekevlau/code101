//based on the CodeAcademy JS tutorial, but I've added more detail to the specified implementation.

function getInput () {
    do {
        userChoice = prompt("Rock, Paper or Scissors?");
    }
    while (userChoice != "Rock" && userChoice != "Paper" && userChoice != "Scissors");
    console.log("Your choice is: " + userChoice);
    return userChoice;
}

function getComp () {
    computerChoice = Math.random();
    if (computerChoice < 0.33) {
        computerChoice = "Rock";
    }
    else if (computerChoice < 0.67) {
        computerChoice = "Paper";
    }
    else {
        computerChoice = "Scissors";
    }
    console.log("The computer chose: " + computerChoice);
    return computerChoice;
}


function compare (userInput, compInput, score){
    if (userInput == "Rock") {
        if (compInput == "Rock") {
            console.log("Tie!");
        }
        
        if (compInput == "Paper") {
            console.log("You Lose!");
            score.comp += 1; 
        }

        if (compInput == "Scissors") {
            console.log("You Win!");
            score.user += 1;
        }
    }

    if (userInput == "Paper") {
        if (compInput == "Rock") {
            console.log("You Win!");
            score.user += 1;
        }
        
        if (compInput == "Paper") {
            console.log("Tie!");
        }

        if (compInput == "Scissors") {
            console.log("You Lose!");
            score.comp += 1;
        }
    }

    if (userInput == "Scissors") {
        if (compInput == "Rock") {
            console.log("You Lose!");
            score.comp += 1;
        }
        
        if (compInput == "Paper") {
            console.log("You Win!");
            score.user += 1; 
        }

        if (compInput == "Scissors") {
            console.log("Tie!");
        }
    }
    
}

//this boolean does not work. why.
//is the only way to pass something by "reference" to make it an object?
//is there any way to "save" modifications done to a variable (predefined globally, even) within a function otherwise?
var bool = {value : false};
while (bool.value != true) {
    var score = {user : 0, comp : 0};
    userChoice = getInput();
    computerChoice = getComp();
    compare(userChoice, computerChoice, score);
    console.log("Here is the score: " + '\n' + "The Computer has: " + score.comp + '\n' + "You have: " + score.user);

    bool.value = prompt("Play Again? 0 for Yes, 1 for No");
}


