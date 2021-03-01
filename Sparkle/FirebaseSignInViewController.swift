//
//  FirebaseSignInViewController.swift
//  Sparkle
//
//  Created by ying kit ng on 2/21/21.
//

import UIKit
import SwiftUI
import Firebase
import GoogleSignIn

import FBSDKLoginKit

private var isMFAEnabled = false

class FirebaseSignInViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?
    
    /** @var microsoftProvider
          @brief The OAuth provider instance for Microsoft.
       */
    var microsoftProvider : OAuthProvider?
    /** @var twitterProvider
          @brief The OAuth provider instance for Twitter.
       */
    var twitterProvider : OAuthProvider?
    /** @var gitHubProvider
          @brief The OAuth provider instance for GitHub.
       */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
       } catch let signOutError as NSError {
         print ("Error signing out: %@", signOutError)
       }

        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)

        if let token = AccessToken.current,
               !token.isExpired {
               // User is logged in, do work such as go to next view controller.
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            // [START auth_listener]
            handle = Auth.auth().addStateDidChangeListener { (auth, user) in

            }
            // [END auth_listener]

//            self.microsoftProvider = OAuthProvider(providerID:"microsoft.com");
//            self.twitterProvider = OAuthProvider(providerID:"twitter.com");

        // Authenticate Game Center Local Player
            // Uncomment to sign in with Game Center
            // self.authenticateGameCenterLocalPlayer()
      }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct FirebaseSignInViewControllerRepresentation: UIViewControllerRepresentable{
    
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<FirebaseSignInViewControllerRepresentation>) -> FirebaseSignInViewController{
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirebaseSignInViewController") as! FirebaseSignInViewController
    }
    
    func updateUIViewController(_ uiViewController: FirebaseSignInViewController, context: UIViewControllerRepresentableContext<FirebaseSignInViewControllerRepresentation>) {
        
    }
}
