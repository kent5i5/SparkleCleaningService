//
//  RegisterView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/26/21.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @Environment(\.presentationMode) var presentation
    @State private var showingAlert = false
    @EnvironmentObject var modelData: User
    @State private var email = ""
    @State private var password = ""
    @State private var phone = ""
    @State private var street = ""
    @State private var zipcode = ""
    @State private var Apt = ""
    @State private var result: String = ""
    
    func registerUser() {
        if modelData.name.isEmpty && !email.isEmpty && !password.isEmpty{
           // let fbhandler = Fbhandler(modelData: modelData)
           // self.result  = fbhandler.registerWithEmail(email: email, password: password)

            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let error = error {
                    result = "login fail:" + error.localizedDescription
                    showingAlert.toggle()
                                
                } else {
                    presentation.wrappedValue.dismiss()
                }
             }
            // [END create_user]
            
        }
    }
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
                .custombackbtn()
                //.foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                
    
            
            SecureField.init("Password", text: $password)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
               
              
            
            TextField("Phone", text: $phone)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
        
            
            TextField("Street", text: $street)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
  
            
            TextField("Apt/Unit", text: $Apt)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
    
            
            TextField("Zip code", text: $zipcode)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
 
            Text("").padding(.bottom, 30)
            
            Button(action:  {
                registerUser()
            }){
                Text("Register")
                    .font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.green.opacity(0.4), radius: 3, x: 1, y: 2)
                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
                    .background(Theme.init().darkGreen)
                    .cornerRadius(25)
                    .foregroundColor(.white)
                    .opacity( 1.0)
                   
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Authenticate Error"), message: Text( self.result ), dismissButton: .default(Text("Got it!")))
            }
            
        }.foregroundColor(Theme.init().darkGreen)
        
     
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
