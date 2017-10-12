
if (localStorage.getItem("discipline")===null) {
    window.location.href = "index.html";
} else {
    console.log(localStorage.getItem("discipline"));
    $.ajax({
        url: "php/rolegrab.php",
        data: {discipline: localStorage.getItem("discipline")},
        type: "post",
        success: function (result) {
            var obj = jQuery.parseJSON(result);
            console.log(obj.role);
            localStorage.setItem("role", obj.role);
        }
    });
}

//Timer and refresher variables
var x;
//var refresh = setInterval(function() {getChat()},500);
var start;

//Contributor get (compare current list with chatlist)



//Chat get, filter via start time
function getChat() {
    $.ajax({
        url:"php/chatrefresh.php",
        success: function (result) {
            console.log(result);
        }
    });
}

//Question get
function getQuestion() {
    $.ajax({
        url:"php/questions.php",
        data:{discipline: localStorage.getItem("discipline")},
        type: 'post',
        success: function (result) {
            console.log(result.length);
            if (result.length === 0) {
                getQuestion();
            } else {
                var question = jQuery.parseJSON(result);
                localStorage.setItem("currentQuestion", JSON.stringify(question[0]));
                localStorage.setItem("currentAnswers", JSON.stringify(question[1]));
                console.log(JSON.parse(localStorage.getItem("currentQuestion"))[1]);
                $.each(JSON.parse(localStorage.getItem("currentAnswers")), function (i, val) {
                    console.log(val[2]);
                });
            }
        }
    });
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
    getQuestion();
    //Answer chatlog

    /*if(correct) {
        terminate();
    } else {
        alert ("Try again");
    }*/
    //terminate();
}


//Terminate if answert correct
function terminate () {
    clearInterval(x);
    $('#timer').html("Time Taken: " + 0 + "h " + 0 + "m " + 0 + "s ");
    //load new question
    //Grab new time from question log
    //start new timer
    start = new Date();
    x = setInterval(function() {timer()},1000);
}