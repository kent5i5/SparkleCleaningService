//
//  LoginView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/1/21.
//

import SwiftUI
import Firebase
import AuthenticationServices

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
        if modelData.name.isEmpty{
            let fbhandler = Fbhandler(modelData: modelData)
            fbhandler.getUserInfo()
        }
    }
    
    func signOut(){
//        let auth = Auth.auth()
//        do {
//            try auth.signOut()
//        } catch let signOutError as NSError {
//          print ("Error signing out: %@", signOutError)
//        }
        
        appData.name = ""
        //modelData.name = ""
        let fbhandler = Fbhandler(modelData: modelData)
        fbhandler.signOut()
    }
    
    func loginExistingUserWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
          //guard let strongSelf = self else { return }
          // ...
            if let error = error {
                print("login fail")
                   
                self.showingAlert = true
                            
            } else {
                getUserInfo()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        
       
    }
    
    func registerUser(email: String, password: String) {
     
      if email.isEmpty == false {
        //user.profile = Profile(nameArg: $email, passwordArg: $password)
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("login fail")
                   
                self.showingAlert = true
                            
            } else {
                user.isRegistered = true
            }
            
        }
       
      }
    }
    
    /*
     Apple sigin functions
     */
//   @AppStorage("storeName")
//
//    private var storeName: String = ""{
//        didSet{
//            email = storeName
//        }
//    }
//    @AppStorage("storedEmail")
//    private var storedEmail: String = ""{
//        didSet {
//            email = storedEmail
//        }
//    }
    
    private func onRequest(_ request: ASAuthorizationAppleIDRequest) {
        print("apple sign in")
        request.requestedScopes = [.fullName, .email]
        //modelData.name =
    }
    
    private func onCompletion(_ result: Result<ASAuthorization, Error>) {
        print("after sign in with apple id")
        switch result {
            case .success(let authResults):
            guard let credential = authResults.credential as? ASPasswordCredential else { return }
//            storeName = credential.fullName.givenName
//            storedEmail = credential.email
//            userID = credential.user
            
        case .failure(let error):
            print("Authorization failed: " + error.localizedDescription)
            
        }
    }
//    private func onAppear(){
//        print("onAppear")
//        
//    }

    

    var body: some View {
        ScrollView {
            
            if !modelData.name.isEmpty{ Text("Welcome! " + modelData.name)}
            else {
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
                        loginExistingUserWithEmail(email: email, password: password)
    //                    if(appData.name.isEmpty){
    //                        print("please enter name")
    //                    }

                    }){
                        Text("Log In")
                            .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                            .font(.footnote)
                            .shadow(color: Color.green.opacity(0.4), radius: 3, x: 1, y: 2)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                        .stroke(lineWidth: 0.5)
                                        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1)))
                            .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                           
                      
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Authenticate Error"), message: Text("Incorrect username and password"), dismissButton: .default(Text("Got it!")))
                    }
                    
                    NavigationLink(destination: RegisterView().environmentObject(modelData),
                                   label: {
                                    Text("Or Register").foregroundColor(.green)})
                    
                }.padding()
                    
                
                
                      
                  if modelData.name.isEmpty {
                    SignInWithAppleButton(.signIn, onRequest: onRequest ,onCompletion: onCompletion
                      ).signInWithAppleButtonStyle(.white)
                  }

                
                Button(action:  {
                    self.isPresented.toggle()
                }) {
            
                    HStack {
                        Text("Google / Facebook").foregroundColor(Color(red: 0, green: 0, blue: 0))
                    }.sheet(isPresented: $isPresented){
                        FirebaseSignInViewControllerRepresentation()
                            .frame(width: 400, height: 600, alignment: .center)
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
