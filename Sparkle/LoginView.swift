//
//  LoginView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/1/21.
//

import SwiftUI
import Firebase


struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    
    
    @State private var isPresented = false
    @State private var showingAlert = false
    @State private var email = ""
    @State private var password = ""
    
//    init(appData: User){
//      email = appData.name
//      password = appData.password

//    }
    

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
            
          appData.setName(name: email!)
          modelData.setName(name: email!)
            
          
        }
    }
    
    func signOut(){
        let auth = Auth.auth()
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        appData.name = ""
        modelData.name = ""
    }
    
    func loginExistingUserWithEmail(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
          //guard let strongSelf = self else { return }
          // ...
            if let error = error {
                print("login fail")
                   
                self.showingAlert = true
                            
            }
        }
        
        getUserInfo()
    }
    
    func registerUser(email: String, password: String) {
      
      if email.isEmpty == false {
        //user.profile = Profile(nameArg: $email, passwordArg: $password)
        var result = Auth.auth().createUser(withEmail: email, password: password) { authResult, error in}
        user.isRegistered = true
      }
    }

    var body: some View {
        ScrollView {
            VStack {

                
                Image("sparkle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text("Sparkle")
                    .padding()
                    

                VStack {
                    TextField("Email/Phone", text: $email)
                        .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top:8, leading: 16,
                                            bottom:8, trailing:0 ))
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 30)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.green))
                        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                    
                    
                    Spacer()
                        .frame(height: 100)
                    
                    SecureField.init("Password", text: $password)
                        .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                        .padding(EdgeInsets(top:8, leading: 16,
                                            bottom:8, trailing:0 ))
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 30)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.green))
                       
                        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                  
                    
                    HStack {
                        Text("Forget your password?")
                            .font(.footnote)
                        Button(action:  {
                            print("close")
                        }){
                            Text("Reset Password")
                                .font(.footnote)
                                .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                        }
                    }
                    
                    Button(action:  {
                        //self.appData.name = email
                        //self.appData.password = password
                        loginExistingUserWithEmail(email: email, password: password)
    //                    if(appData.name.isEmpty){
    //                        print("please enter name")
    //                    }
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Log In")
                            .font(.footnote)
                            .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Authenticate Error"), message: Text("Incorrect username and password"), dismissButton: .default(Text("Got it!")))
                    }
                    
                }.padding()
                    
                
         

                
                Button(action:  {
                    self.isPresented.toggle()
                }) {
            
                    HStack {
                        Text("Google / Facebook")
                    }.sheet(isPresented: $isPresented){
                        FirebaseSignInViewControllerRepresentation()
                            .onDisappear(){
                                getUserInfo()
                            }
                    }
                }

                //Spacer()
            }.onAppear(){getUserInfo()}
            //.navigationTitle("Title")
            .navigationBarHidden(false)
        }

    }
}

//let serviceSession = serviceStore()

let user = User()
#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(appData: user)
            //.environmentObject()
    }
}
#endif
