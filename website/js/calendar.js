var currentMonth = new Date().getMonth();
var currentYear = new Date().getFullYear();
var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

function daysInMonth(month, year) {
    return new Date(year, month, 0).getDate();
}

function getMood(day, month, year, callback) {
    let user = firebase.auth().currentUser;
    let refStr = `history/${user.uid}/${year}${('000' + month).slice(-2)}${('000' + day).slice(-2)}`;
    let historyRef = firebase.database().ref(refStr);

    return historyRef.on('value', (snapshot) => {
        if (snapshot && snapshot.val()) {
            callback(snapshot.val().status);
        } else {
            callback("neutral");
        }
    });
}

function addDays() {
    $(".calendar").html("");
    $("#month").text(`${monthNames[currentMonth]} ${currentYear}`);

    let totalDays = daysInMonth(currentMonth + 1, currentYear);

    for (var i = 1; i <= totalDays; i++) {
        let nStencil = `
        <div class="col neutral flex-container" id="mood${i}">
        <h4 class="day">${i}</h4>
        </div>`;

        $(".calendar").append(nStencil);

        let j = i;
        getMood(j, currentMonth + 1, currentYear, (mood) => {
            $(`#mood${j}`).removeClass("neutral good bad").addClass(mood);
        });
    }
}

function cycleMonth(direction) {

    if (direction == "up") {
        currentMonth++;
    } else {
        currentMonth--;
    }

    if (currentMonth > 11) {
        currentYear++;
        currentMonth = 0;
    }

    if (currentMonth < 0) {
        currentYear--;
        currentMonth = 11;
    }

    addDays();
}

$(document).ready(function () {
    const firebaseConfig = {
        apiKey: "AIzaSyC0Ll7NEbHQJUODgv_Df_ryLdSIxPQ8rLo",
        authDomain: "depression-1e371.firebaseapp.com",
        databaseURL: "https://depression-1e371-default-rtdb.firebaseio.com",
        projectId: "depression-1e371",
        storageBucket: "depression-1e371.appspot.com",
        messagingSenderId: "837280416864",
        appId: "1:837280416864:web:f81415e3a4aa2f6de42f05",
        measurementId: "G-G7GRX9K0K2"
    };
    firebase.initializeApp(firebaseConfig);

    firebase.auth().getRedirectResult().then(() => {
        let user = firebase.auth().currentUser;

        if (user) {
            $("#decMonth").click(function () {
                cycleMonth("down")
            })
            $("#incMonth").click(function () {
                cycleMonth("up")
            })
            addDays();
        } else {
            location.href = "../index.html";
        }
    });
});
