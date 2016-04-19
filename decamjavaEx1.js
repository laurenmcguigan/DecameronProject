function trivia() {
    var answer = prompt("Who is typically the last storyteller of each day in the Decameron?", "Type answer here");
    if (answer != null) {
    document.getElementById("trivia").innerHTML =
        "You answered " + answer + ". The correct answer is Dioneo!";    
    } }
    /* this is supposed to output a trivia question and a window to type in an answer. I adapted this from the w3schools tutorial. */