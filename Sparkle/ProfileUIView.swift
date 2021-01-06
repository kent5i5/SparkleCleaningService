//
//  ProfileUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ProfileUIView: View {
    @State var username = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image(systemName: "pencil.tip")
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Form {
//                    Section(header: Text("PROFILE")) {
//                        TextField("Username", text: $username)
//                    }
                    
                    
                    NavigationLink(destination: CalenderUIView()) {
                        Text("account")
                    }
                
                    NavigationLink(destination: CalenderUIView()) {
                        Text("Change password")
                    }
                    NavigationLink(destination: CalenderUIView()) {
                        Text("Payment")
                    }
                    
                    NavigationLink(destination: CalenderUIView()) {
                        Text("Location")
                    }
                    NavigationLink(destination: CalenderUIView()) {
                        Text("Promo")
                    }
                    NavigationLink(destination: CalenderUIView()) {
                        Text("Notification")
                    }
                    
                    NavigationLink(destination: CalenderUIView()) {
                        Text("Support")
                    }
                }
                //.navigationBarTitle("Settings")
                
            
            
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("2.2.1")
                    }
                }
            }
        }
            
       
    }
}

struct ProfileUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUIView()
    }
}
