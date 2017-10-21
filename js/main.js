

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

        var role;

        if (obj.role === "GUI") {
            role = "GUIDE";
        } else {
            role = "SOLVER";
        }

        $('#roledisplay').html("Greetings " + localStorage.getItem("discipline") + " student, you are a " + role);

        localStorage.setItem("role", obj.role);
    }
});

//Timer and refresher variables
    var x;
    var refresh = setInterval(function() {getChat()},1000);
    var start;

    //number of attempts and attempt timer
    var attempt = 0;
    var totaltime = 0;
    var chatlength = 0;

    //init solve count
    localStorage.setItem("solvecount", "0");

    //First timer
    start = new Date();
    x = setInterval(function() {timer()},1000);



//Contributor get (compare current list with chatlist)
//Chat get, filter via start time
//Check for question updates if guide
function getChat() {
    $.ajax({
        url:"php/chatrefresh.php",
        success: function (result) {

            if (result.length > chatlength) {
                chatlength = result.length;

                $('#display').animate({
                    scrollTop: $('#display').get(0).scrollHeight});

                $('#display').html(result);
            }

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
                        if (val[3] === 1) {
                            $('#answer').append("<ul style='color:green;font-weight: bold;'>" + "- " + val[2] + "</ul>");
                        } else {
                            $('#answer').append("<ul>" + "- " + val[2] + "</ul>");
                        }

                    });
                }

            }

        });


        $.ajax({
            url: "php/rolegrab.php",
            data: {discipline: localStorage.getItem("discipline")},
            type: "post",
            success: function (result) {
                var obj = jQuery.parseJSON(result);

                console.log(obj.role);

                if(localStorage.getItem("role") != obj.role) {
                    location.reload();
                }
            }
        });

        /*
        var otherdisc;

        if (localStorage.getItem("discipline") === "PSY") {
            otherdisc = "IT";
        } else if (localStorage.getItem("discipline") === "IT") {
            otherdisc = "PSY";
        }
        */

        /*
        $.ajax({
            url:"php/countsolved.php",
            data:{discipline: otherdisc},
            type: 'post',
            success: function (result) {
                localStorage.setItem("solvecount", parseInt(result));
            }
        });

        if(parseInt(localStorage.getItem("solvecount")) === 6) {

            localStorage.setItem("solvecount", 0);
            //refresh page, solver side will handle flipping
            setTimeout(function()
            {
                location.reload();
            }, 5000);
        }
        */
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

    attempt += 1;

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
                        attempts: attempt,
                        time: totaltime
                        },
                type: 'post'
            });

            terminate();
        } else {
            alert("Try again");
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
    totaltime = 0;


    //Check if completed


    //Reset current timer value

    resetTimer();

    $.ajax({
        url:"php/countsolved.php",
        data:{discipline: localStorage.getItem("discipline")},
        type: 'post',
        success: function (result) {
            localStorage.setItem("solvecount", parseInt(result));
        }
    });

    $.ajax({
        url:"php/roleflip.php",
        success: function () {
            location.reload();
        }
    });

    /*
    if(parseInt(localStorage.getItem("solvecount")) === 6) {

        localStorage.setItem("solvecount", 0);
        //flip and refresh

    } else {

        //load new question
        getQuestion();
        //start new timer

        start = new Date();
        x = setInterval(function() {timer()},1000);
    }
    */
}

function resetTimer() {

    clearInterval(x);
    $('#timer').html("Time Taken: " + 0 + "h " + 0 + "m " + 0 + "s ");

}


//runs timer
function timer() {

    var now = new Date() - start;

    totaltime = Math.floor((now/1000));

    var hours = Math.floor((now % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((now % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((now % (1000 * 60)) / 1000);

    $('#timer').html("Time Taken: " + hours + "h " + minutes + "m " + seconds + "s ");

}

$("#mess").keydown(function (event) {
    var keypressed = event.keyCode || event.which;
    if (keypressed === 13) {
        send();
    }
});

function send() {
    console.log($('#mess').val().length);
    if($('#mess').val().length > 0) {
        $.ajax({
            url:"php/send.php",
            data:{uid: localStorage.getItem("id"),
                name: localStorage.getItem("name"),
                role: localStorage.getItem("role"),
                message: $('#mess').val()},
            type: 'post'
        });

        $('#mess').val("");
    }
}