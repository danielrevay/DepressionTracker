function submitValue() {
    let user = firebase.auth().currentUser;
    let date = new Date();

    let refStr = `history/${user.uid}/${date.getFullYear()}${('000' + (date.getMonth() + 1)).slice(-2)}${('000' + date.getDate()).slice(-2)}`;
    let mood = $("input[name='todaysMood']:checked").val();

    return firebase.database().ref(refStr).set({
        status: mood
    });
}

$( document ).ready(function() {
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
        if (firebase.auth().currentUser) {
            $("#submitDay").click(() => {
                submitValue().then(() => {
                    location.href = "../history/index.html";
                });
            });
        } else {
            location.href = "../index.html";
        }
    });
});