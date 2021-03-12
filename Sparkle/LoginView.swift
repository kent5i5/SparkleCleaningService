//
//  LoginView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/1/21.
//

import SwiftUI


struct LoginView: View {
    //@EnvironmentObject var user: User
    @ObservedObject var appData: User
    
    @State private var isPresented = false
    
    @State private var email = ""
    @State private var password = ""
    
//    init(){
//        email = appData.name
//        password = appData.password
//    }
    
    func registerUser() {
      if email.isEmpty == false {
        //user.profile = Profile(nameArg: $email, passwordArg: $password)
        user.isRegistered = true
      }
    }
    var body: some View {

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
                    self.appData.name = email
                    self.appData.password = password
                }){
                    Text("Save")
                        .font(.footnote)
                        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                }
                
            }.padding()
                
            
     

            
            Button(action:  {
                self.isPresented.toggle()
            }) {
        
                HStack {
                    Text("Google / Facebook")
                }.sheet(isPresented: $isPresented){
                    FirebaseSignInViewControllerRepresentation()
                }
            }
            

            //Spacer()
        }
        //.navigationTitle("Title")
        .navigationBarHidden(false)
        
        
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
