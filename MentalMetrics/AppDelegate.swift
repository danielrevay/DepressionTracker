//
//  AppDelegate.swift
//  MentalMetrics
//
//  Created by Daniel Revay on 4/17/21.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var moodValue = 0
    var ref: DatabaseReference!
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        // ...
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
      // ...
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            let authError = error as NSError
            //self.showMessagePrompt(error.localizedDescription)
            
            // ...
            return
          }
          // User is signed in
          // ...
            self.ref = Database.database().reference()
            
            let date = Date()
            let cal = Calendar.current
            let year = cal.component(.year, from: date as Date)
            let month = cal.component(.month, from: date as Date)
            let day = cal.component(.day, from: date as Date)
            //write to ref
            //'history/userid/YYYYMMDD'
            var mood = ""
            if self.moodValue == 0 {
                mood = "good"
            }
            if self.moodValue == 1 {
                mood = "neutral"
            }
            if self.moodValue == 2 {
                mood = "bad"
            }
            print("p")
            //let userID = user.userID
            guard let userID = Auth.auth().currentUser?.uid else {return}
            print("q")
            let day_0 = String(format: "%04d%02d%02d", year, month, day)
            self.ref.child("history/"+userID+"/"+day_0).setValue(["status":mood])
            print("uhh it should be done here")
        }

        
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

