//
//  FirebaseSignInViewController.swift
//  Sparkle
//  The contorller display Qauth sign in buttons
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
    
    @IBOutlet weak var fbview: UIView!
    @IBOutlet weak var googleButton: GIDSignInButton!
    
    @IBOutlet var myView: UIView!
    
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
        
        /*
         Facebook login button
         */
        
        let loginButton = FBLoginButton()
//        let v = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        v.backgroundColor = .red
        loginButton.backgroundColor = .red
        loginButton.frame =  CGRect(x: 10, y: 10, width: 394, height:40)
        //fbview.addSubview(loginButton)
//        loginButton.addConstraint(
//            NSLayoutConstraint(item: v,
//                               attribute: .leading,
//                               relatedBy: .equal,
//                               toItem: googleButton,
//                               attribute: .leading,
//                               multiplier: 1, constant: 0
//                               )
//        )
        loginButton.center = fbview.center
        
        loginButton.permissions = ["public_profile", "email"]
       // view.addSubview(loginButton)
        
        //if login diplay the close button for the user to go back

        if let token = AccessToken.current,
               !token.isExpired {
               // User is logged in, do work such as go to next view controller.
        }
        
        self.myView.frame(forAlignmentRect: CGRect(x: 0 , y: 0, width: self.view.frame.width, height: self.view.frame.height*0.3))
        self.myView.backgroundColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            // [START auth_listener]
            handle = Auth.auth().addStateDidChangeListener { (auth, user) in
                if let user = user {
                    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
                    
                    self.dismiss(animated: true)
                }
                
            }
            // [END auth_listener]

//            self.microsoftProvider = OAuthProvider(providerID:"microsoft.com");
//            self.twitterProvider = OAuthProvider(providerID:"twitter.com");

        // Authenticate Game Center Local Player
            // Uncomment to sign in with Game Center
            // self.authenticateGameCenterLocalPlayer()
      }

}


/*
 Representation of the controller allows other swiftui Views to treat UIView and Controler like swiftui view
 */
struct FirebaseSignInViewControllerRepresentation: UIViewControllerRepresentable{
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<FirebaseSignInViewControllerRepresentation>) -> FirebaseSignInViewController{
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirebaseSignInViewController") as! FirebaseSignInViewController
//
//        fireViewC = context.coordinator
//
//        return fireViewC
    }
    
    func updateUIViewController(_ uiViewController: FirebaseSignInViewController, context: UIViewControllerRepresentableContext<FirebaseSignInViewControllerRepresentation>) {
        
    }
    
}

//class Coordinator: NSObject {
//        var parent: FirebaseSignInViewController
//        var controllers = [UIViewController]()
//
//        init(_ pageViewController: FirebaseSignInViewController) {
//            parent = pageViewController
//
//        }
//}
