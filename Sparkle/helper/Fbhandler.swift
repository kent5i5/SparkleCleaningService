//
//  fbhandler.swift
//  Sparkle
//
//  Fbhanlder handle firebase user related functions : Create , Sign In,  Update User , Load User data
//
//  Created by ying kit ng on 3/16/21.
//


import Firebase

class Fbhandler {
    private let db = Firestore.firestore()
    var modelData: User
    
    init(modelData: User){
        self.modelData = modelData
    }
    
    func loginExistingUserWithEmail(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
            
            
        }
        
        self.modelData.isRegistered = true
    }
    
    func registerWithEmail(email: String, password: String ) -> String{
        var result = ""
        // [START create_user]
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                print("login fail:" + error.localizedDescription )
                return result =  error.localizedDescription + "..." 
                            
            } else {
                return result = ""
            }
         }
        // [END create_user]
        return result

    }
    
    
    func signOut(){
        self.modelData.uid = ""
        self.modelData.name = ""
        self.modelData.password = ""
        self.modelData.address = ""
        self.modelData.country = ""
        self.modelData.city = ""
        let auth = Auth.auth()
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    func getUserInfo() {
       
        let user = Auth.auth().currentUser
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
          let uid = user.uid
          let email = user.email
          let photoURL = user.photoURL
          var multiFactorString = "MultiFactor: "
          for info in user.multiFactor.enrolledFactors {
            multiFactorString += info.displayName ?? "[DispayName]"
            multiFactorString += " "
          }
            modelData.uid = uid
            loadUser(uid:uid)
            modelData.setName(name: email!)
          // ...
        }
        
        
        
        //return modelData
    }
    
    
    /*
     FireStore Functions
     */
    
    private func loadUser(uid: String){
        
        let document  = db.document("users/" + uid)

        
        document.getDocument { (document , err) in
            if let document = document, document.exists {
                //let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                //print("Document data: \(dataDescription)")
                let dataDescription = document.data()
                               
                self.modelData.address = dataDescription?["address"] as! String
                self.modelData.country = dataDescription?["country"] as! String
                self.modelData.city = dataDescription?["city"] as! String
  
                
            } else {
                print("User info does not exist")
            }
        }
        
    }
    
    func storeUserData(){
        let citiesRef = db.collection("users")
        citiesRef.document(modelData.uid).setData([
            "name": modelData.name,
            "address": modelData.address,
            "country": modelData.country,
            "city": modelData.city
            //"state": "CA",
            //jobs
            //etc
            ])
        
    }
    
    func storeUserData(uid: String, name: String, country: String, address: String, city: String){
        let citiesRef = db.collection("users")
        citiesRef.document(uid).setData([
            "name": name,
            "address": address,
            "country": country,
            "city": city
            //"state": "CA",
            //jobs
            //etc
            ])
        
    }
    
    func storeService( sid: String){
        //let serviceRef = db.collection("service/" + sid);
        //let serviceRef = db.collection("users/" + modelData.uid + "/serviceRef")
        let serviceRef = db.collection("servicelist")
        let index = "s" + Int.random(in: 0..<1000000).description
        serviceRef.document(modelData.uid).setData([index :sid], merge: true)
    }
    

    
    func removeDocument(layer1: String, layer2: String){
        db.collection(layer1).document(layer2).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}
