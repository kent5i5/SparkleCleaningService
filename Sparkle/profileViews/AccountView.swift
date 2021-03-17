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
        ZStack {
            VStack {
                Text("Account")
                Image(systemName: "arrow")
                Divider()
                List {
                    Text("Username: " + modelData.name)
                    Text("Address")
                    Text("Country")
                    Text("City")
                    
                }
               
                Spacer()
                
            }.onAppear(){getUserInfo()}
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(User())
    }
}
