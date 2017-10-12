console.log(localStorage.getItem("discipline"));



if (localStorage.getItem("discipline")===null) {
    window.location.href = "index.html";
} else {
    console.log(localStorage.getItem("discipline"));
}

//Timer and refresher variables
var x;
var refresh = setInterval(function() {getChat()},500);
var start;

//Contributor get (compare current list with chatlist)



//Chat get, filter via start time
function getChat() {
     $.post("php/chatrefresh.php",
            {},
         function(data, status) {
             console.log(status + " " + data);
    });
}

//Question get
function getQuestion() {

}


//Starts/resets timer
function timer() {

    var now = new Date() - start;

    var hours = Math.floor((now % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((now % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((now % (1000 * 60)) / 1000);

    console.log (hours + "h " + minutes + "m " + seconds + "s ");
    $('#timer').html("Time Taken: " + hours + "h " + minutes + "m " + seconds + "s ");

}


function submitAnswer () {

    //Answer chatlog

    /*if(correct) {
        terminate();
    } else {
        alert ("Try again");
    }*/
    terminate();
}


//Terminate if answert correct
function terminate () {
    clearInterval(x);
    $('#timer').html("Time Taken: " + 0 + "h " + 0 + "m " + 0 + "s ");
    start = new Date();
    console.log(start);
    x = setInterval(function() {timer()},1000);
    //load new question
    //start new timer
}