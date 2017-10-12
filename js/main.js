

if (localStorage.getItem("discipline") === null) {
    window.location.href = "index.html";

} else {
    console.log(localStorage.getItem("discipline"));

}

$.ajax({
    url: "php/rolegrab.php",
    data: {discipline: localStorage.getItem("discipline")},
    type: "post",
    success: function (result) {
        var obj = jQuery.parseJSON(result);

        console.log(obj.role);

        if(obj.role === "GUI") {
            //hide timer and submit
            $('#timer').hide();
            $('#subanswer').hide();
        } else if (obj.role === "SOL") {
            $('#timer').show();
            $('#subanswer').show();
            //Get first question if solver
            getQuestion();
        }

        localStorage.setItem("role", obj.role);
    }
});

//Timer and refresher variables
    var x;
    var refresh = setInterval(function() {getChat()},1000);
    var start;

    var attempt = 0;

//First timer
//x = setInterval(function() {timer()},1000);



//Contributor get (compare current list with chatlist)
//Chat get, filter via start time
//Check for question updates if guide
function getChat() {
    $.ajax({
        url:"php/chatrefresh.php",
        success: function (result) {
            //if reset system message, switch teams and refresh page
            //console.log(result);
        }
    });

    if(localStorage.getItem("role") === "GUI") {
        $.ajax({
            url:"php/newq.php",
            type: 'post',
            success: function (result) {
                var question = jQuery.parseJSON(result);

                if(question[0] === null) {
                    $('#answer').empty();
                    $('#question').html("No question to guide yet. Try refreshing after a few seconds!");
                } else {

                    $('#question').html(question[0]["text"]);

                    $('#answer').empty();

                    $.each(question[1], function (i, val) {

                        $('#answer').append("<ul>" + "- " + val[2] + "</ul>");

                    });
                }

            }

        });
    }

}

//Question get
function getQuestion() {
    $.ajax({
        url:"php/questions.php",
        data:{discipline: localStorage.getItem("discipline")},
        type: 'post',
        success: function (result) {
            //console.log(result.length);
            if (result.length === 0) {
                getQuestion();

            } else {
                var question = jQuery.parseJSON(result);
                $('#question').html(question[0][1]);

                localStorage.setItem("question", question[0][0]);

                $('#answer').empty();

                $.each(question[1], function (i, val) {

                    $('#answer').append("<input id='rad' type='radio' name='answer' value='" + val[3] + "'>" + val[2] + "</input><br />");

                });
            }
        }
    });
}

function submitAnswer () {
    //If an answer is checked
    if($('[name="answer"]').is(':checked')) {
        //Correct answer
        if(parseInt($('[name="answer"]:checked').val()) === 1) {
            //Update solvelog

            $.ajax({
                url:"php/correct.php",
                data:{id: localStorage.getItem("id"),
                        qid: localStorage.getItem("question"),
                        discipline: localStorage.getItem("discipline"),
                        attempts: attempt
                        },
                type: 'post',
            });

            terminate();
        } else {
            alert("Try again");
            attempt += 1;
        }
    } else {
        alert("Please select an answer");
    }
    //getQuestion();
    //Answer chatlog

    /*if(correct) {
        terminate();
    } else {
        alert ("Try again");
    }*/
}


//Terminate if answer correct
function terminate () {
    attempt = 0;

    var solvecount = 0;


    //Check if completed


    //Reset current timer value

    clearInterval(x);
    $('#timer').html("Time Taken: " + 0 + "h " + 0 + "m " + 0 + "s ");

    $.ajax({
        url:"php/countsolved.php",
        data:{discipline: localStorage.getItem("discipline")},
        type: 'post',
        success: function (result) {
            solvecount= parseInt(result);
        }
    });

    console.log(solvecount);

    if(solvecount === 6) {
        //send system message that triggers reset

    } else {

        //load new question
        getQuestion();
        //Grab new time from question log
        //start new timer

        start = new Date();
        x = setInterval(function() {timer()},1000);
    }
}

function resetTimer() {



}



//runs timer
function timer() {

    var now = new Date() - start;

    var hours = Math.floor((now % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((now % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((now % (1000 * 60)) / 1000);

    $('#timer').html("Time Taken: " + hours + "h " + minutes + "m " + seconds + "s ");

}