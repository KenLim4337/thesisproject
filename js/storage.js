console.log("Redy");

localStorage.setItem("discipline","");

function selit() {
    localStorage.setItem("discipline","IT");
    $('#pickit').addClass("selected");
    $('#pickpsy').removeClass("selected");
}

function selpsy() {
    localStorage.setItem("discipline","PSY");
    $('#pickpsy').addClass("selected");
    $('#pickit').removeClass("selected");
}

$('#button').click(function () {
    console.log("clicked");
    if (localStorage.getItem("discipline")==="") {
        console.log("Not set");
        alert("Please pick your discipline")
    } else {
        console.log(localStorage.getItem("discipline"));
        window.location.href="main.html";
    }
});
