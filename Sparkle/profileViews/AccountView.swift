//
//  AccountView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI
import Firebase

struct AccountView: View {
    @EnvironmentObject var modelData: User
    @State private var showEdit = false
    @State private var name = ""
    @State private var address = ""
    @State private var country = ""
    @State private var city = ""
    
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

          modelData.setName(name: email!)
            
          
        }
    }
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Account")
               
                displayProfile(name: $name, address: $address, country: $country, city: $city).environmentObject(User())
                
                
            }.onAppear(){getUserInfo()}
        }.navigationBarItems(trailing: Button(action: {
            showEdit = true
        }){
            Text("Edit")
            
        }.sheet(isPresented: $showEdit, content: {
            EditProfile(showModal: $showEdit, name: $name, address: $address, country: $country, city: $city
            ).animation(.easeIn)
            .transition(.asymmetric(insertion: .opacity, removal: .scale))
          
        }))

    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(User())
    }
}

struct displayProfile: View {
    @EnvironmentObject var modelData: User
    @Binding  var name: String
    @Binding var address: String
    @Binding var country: String
    @Binding var city: String
    
    var body: some View {
        
            Image(systemName: "arrow")
            Divider()
            List {
                
                
                infomationRow(rowName: "Username: ", data: name )
                infomationRow(rowName: "Address: ", data: address )
                infomationRow(rowName: "Country: ", data:country )
                infomationRow(rowName: "City: ", data: city )
//
//
//                Text("Address: " + address )
//                Text("Country: " + country)
//                Text("City: " + city)
                
            }
            
            Spacer()
        }
    
}

struct EditProfile: View {
    @Binding var showModal: Bool
    @Binding  var name: String
    @Binding var address: String
    @Binding var country: String
    @Binding var city: String
    
    var body: some View {
        VStack {
            
            TextField("Username: " , text: $name)
        
            TextField("Address", text: $address)
            TextField("Country",  text: $country)
            TextField("City", text: $city)
        
            Button(action: {
                //modelData.name = name
                self.showModal = false
            }){
               Text("Done Change")
            }
            
            Button(action: {
                //modelData.name = name
                self.showModal = false
            }){
               Text("Cancel")
            }
        }
    }
}

struct infomationRow: View {
    var rowName: String
    var data: String
    
    var body: some View {
        HStack {
        Text("Username: " ).bold()
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
            .background(Color.white)

        
        Text(data)
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
            .padding(EdgeInsets(top:8, leading: 16,
                                bottom:8, trailing:0 ))
            .background(Color.white)
//            .overlay(RoundedRectangle(cornerRadius: 30)
//                        .stroke(lineWidth: 2))
        }
    }
}
