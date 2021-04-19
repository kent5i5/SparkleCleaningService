//
//  ChangePasswordView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI
import FirebaseAuth

struct ChangePasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @State private var showingAlert = false
    @State private var emailSended = false
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var ReenterNewPassword = ""
    func checkpasswords(){
        if !modelData.name.isEmpty{
            Auth.auth().sendPasswordReset(withEmail: modelData.name) { (error) in
                if error != nil {
                    print("Error: " + error.debugDescription)
                    self.showingAlert.toggle()
                    return
                }
            }
            self.emailSended.toggle()
        }
       
    }
    
    
    var body: some View {
        
        VStack {
            Text("Change password")
                .frame(width: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Spacer()
                .frame(height: 100)
            
            //TextFields(oldPassword: $oldPassword, newPassword: newPassword, ReenterNewPassword: ReenterNewPassword)
            
            if emailSended == false {
                Button( action: {
                    print("Change password")
                    checkpasswords()
                }){
                    
                    Text("Update password").alert(isPresented: $showingAlert) {
                        Alert(title: Text("Authenticate Error"), message: Text("Invalid Email"), dismissButton: .default(Text("Got it!")))
                    }
                }.frame(width: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.green)
                
            } else {
                Text("Please check the email address assoicate with this account").font(.caption)
            }
          
            Button("cancel") {
                       presentationMode.wrappedValue.dismiss()
            }.foregroundColor(.black)
            Spacer()
            
           
        }.custombackbtn()
    
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}

struct TextFields: View {
    @Binding private var oldPassword: String
    @Binding private var newPassword: String
    @Binding private var ReenterNewPassword: String
    var body: some View {
        TextField("Old Password", text: $oldPassword)
            .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(EdgeInsets(top:8, leading: 16,
                                bottom:8, trailing:0 ))
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.green))
            .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
        
        
        Spacer()
            .frame(height: 60)
            
        TextField("New Password", text: $newPassword)
            .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
            .padding(EdgeInsets(top:8, leading: 16,
                                bottom:8, trailing:0 ))
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.green))
           
            .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
        
        Spacer()
            .frame(height: 60)
            
        TextField("Reenter New Password", text: $ReenterNewPassword)
            .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
            .padding(EdgeInsets(top:8, leading: 16,
                                bottom:8, trailing:0 ))
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.green))
           
            .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
        
    }
}
