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
        if (!firebase.auth().currentUser) {
            location.href = "../index.html";
        }
    });
});