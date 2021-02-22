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


class FirebaseSignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()

        
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
