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
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: User
    @ObservedObject var appData: User
    
    
    @State private var isPresented = false
    @State private var showingAlert = false
    @State private var email = ""
    @State private var password = ""
    @State private var isLogin = false

    let theme = Theme()
//    init(appData: User){
//      email = appData.name
//      password = appData.password

//    }
    
    private func storePersistConext(){
        //let newJob = Job(context: self.context)
    }

    func getUserInfo() {
        if modelData.name.isEmpty{
            let fbhandler = Fbhandler(modelData: modelData)
            fbhandler.getUserInfo()
        }
    }
    
    func signOut(){
        
        appData.name = ""
  
        let fbhandler = Fbhandler(modelData: modelData)
        fbhandler.signOut()
    }
    
    func loginExistingUserWithEmail(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
          //guard let strongSelf = self else { return }
          // ...
            if error != nil {
                print("login fail")
                   
                self.showingAlert = true
                            
            } else {
                getUserInfo()
               // self.presentationMode.wrappedValue.dismiss()
            }
        }
        isLogin = true
       
    }
    
    func registerUser(email: String, password: String) {
     
      if email.isEmpty == false {
        //user.profile = Profile(nameArg: $email, passwordArg: $password)
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
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
            
            if !modelData.name.isEmpty{
                
                VStack {
                    Text("Welcome! " + modelData.name)
           
                    NavigationLink(
                        destination: ContentView(appData: appData).environmentObject(modelData).environmentObject(serviceData),
                        isActive: $isLogin,
                        label: {
                            HStack {
                                Image("chervon.right")
                                Text("Stating using our service")
                                    .custombackbtn()
                            }
                    })
                }
            }
            else {
            VStack {

                
                Image("sparkle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.left.circle")
                                        Text("CANCEL")
                                    }.foregroundColor(theme.darkGreen)
                            }).navigationBarBackButtonHidden(true)
                
                Spacer()
                    .frame(height: 60)

                VStack {
                    TextField("Email/Phone", text: $email)
                        .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .sparkletextfield()
                    
                    
                    Spacer()
                        .frame(height: 50)
                    
                    SecureField.init("Password", text: $password)
                        .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                        .sparkletextfield()
                       
                  
                    
                    HStack {
                        Text("Forget your password?").font(.custom("Times New Roman", size: 13))
                        Button(action:  {
                            print("close")
                        }){
                            Text("Reset Password").font(.custom("Times New Roman", size: 13))
                                .foregroundColor(theme.darkGreen)
                        }
                    }
                    Spacer()
                        .frame(height: 60)

                    Button(action:  {
                        loginExistingUserWithEmail(email: email, password: password)
    //                    if(appData.name.isEmpty){
    //                        print("please enter name")
    //                    }

                    }){

                        Text("Log In").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .sparklefilledbutton()
                           
                      
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Authenticate Error"), message: Text("Incorrect username and password"), dismissButton: .default(Text("Got it!")))
                    }

                    
                }.padding()
                    
                
                
                      
                  if modelData.name.isEmpty {
                    SignInWithAppleButton(.signIn, onRequest: onRequest ,onCompletion: onCompletion
                      ).signInWithAppleButtonStyle(.white)
                  }

                
                Button(action:  {
                    self.isPresented.toggle()
                }) {
            
                    HStack {
                        Text("Google").foregroundColor(Color(red: 0, green: 0, blue: 0))
                    }.sheet(isPresented: $isPresented){
                        FirebaseSignInViewControllerRepresentation()
                            .frame(width: 400, height: 600, alignment: .center)
                            .onDisappear(){
                                getUserInfo()
                            }
                    }
                }

            }.onAppear(){getUserInfo()}
           
        }
        }.foregroundColor(theme.darkGreen)
    }
}


let user = User()
#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(appData: user)
            
    }
}
#endif
