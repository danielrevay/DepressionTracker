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

    var ui = new firebaseui.auth.AuthUI(firebase.auth());

    firebase.auth().getRedirectResult().then(() => {
        if (firebase.auth().currentUser) {
            location.href = "./welcome/index.html";
        } else {
            firebase.auth().setPersistence(firebase.auth.Auth.Persistence.SESSION).then(() => {
                ui.start('#firebaseui-auth-container', {
                    callbacks: {
                        signInSuccessWithAuthResult: function(authResult, redirectUrl) {
                            let user = firebase.auth().currentUser;
                            firebase.database().ref(`users/${ user.uid }`).set({
                                name: user.displayName
                            }).then(() => {
                                location.href = "./welcome/index.html";
                            });

                            return false;
                        },
                        uiShown: function() {
                            document.getElementById('loader').style.display = 'none';
                        }
                    },
                    signInFlow: 'redirect',
                    signInOptions: [
                        // List of OAuth providers supported.
                        firebase.auth.GoogleAuthProvider.PROVIDER_ID
                    ],
                    signInSuccessUrl: './welcome/index.html'
                });
            });
        }
    });
});