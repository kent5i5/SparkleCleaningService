//
//  AccountView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI
import Firebase

struct AccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @State private var showEdit = false
    @State private var uid = ""
    @State private var name = ""
    @State private var address = ""
    @State private var country = ""
    @State private var city = ""
    
    private func delayText() {
            // Delay of 7.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
               // hasTimeElapsed = true
                let fbhandler = Fbhandler(modelData: modelData)
                fbhandler.getUserInfo()
            }
   }

    var body: some View {
  
            VStack {
                Text("Account").font(.title).foregroundColor(.green)
               
                if !modelData.name.isEmpty{
                    displayProfile(name: $name, address: $address, country: $country, city: $city).environmentObject(modelData)
     
                } else {
                    LoginView(appData: User()).environmentObject(User())
                    Button("DONE") {
                               presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(.green)
                
                    
                }
                Spacer()
                
            }.onAppear(){print("renew user data")
                
            }.navigationBarItems(trailing: Button(action: {
                withAnimation{
                    showEdit = true
                }
            
            }){
                Text("Edit")
                
            }.sheet(isPresented: $showEdit, content: {
                EditProfile(showModal: $showEdit, uid: $uid, name: $name, address: $address, country: $country, city: $city
                ).animation(.easeIn)
                .transition(.asymmetric(insertion: .opacity, removal: .scale))
                .environmentObject(modelData)
   
            }).onDisappear(){})

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
                
                
                VStack {
                    infomationRow(rowName: "Username: ", data: modelData.name  )
                    infomationRow(rowName: "Address: ", data: modelData.address )
                    infomationRow(rowName: "Country: ", data: modelData.country )
                    infomationRow(rowName: "City: ", data: modelData.city )
                }.custombackbtn()
              

            }
    }

    
}

struct EditProfile: View {
    @EnvironmentObject var modelData: User
    @Binding var showModal: Bool
    @Binding var uid: String
    @Binding var name: String
    @Binding var address: String
    @Binding var country: String
    @Binding var city: String
    
    private func updateUser(){
        let fbhandler = Fbhandler(modelData: modelData)
        fbhandler.storeUserData()

    }
    
    var body: some View {
        ZStack {
            VStack {
                
               // TextField("Username: " , text: $name)
            
                TextField("Address", text: $modelData.address)
                TextField("Country",  text: $modelData.country)
                TextField("City", text: $modelData.city)
            
                Button(action: {
                    //modelData.name = name
                    updateUser()
                    self.showModal = false
                }){
                   Text("DONE")
                }
                
                Button(action: {
                    //modelData.name = name
                    self.showModal = false
                }){
                   Text("CANCEL")
                }
                Spacer()
            }.padding()
            .onAppear(){
                
            }
        }
    }
}

struct infomationRow: View {
    var rowName: String
    var data: String
    
    var body: some View {
        
        ZStack {
            VStack{
                HStack {
                    Text( rowName + ": " ).bold()
                    .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                    .background(Color.white)
                    .padding(EdgeInsets(top:8, leading: 8,
                                        bottom:8, trailing:0 ))
                        .foregroundColor(.green)
                    Spacer()
                }

            
            Text(data)
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                
                Divider()

            }
        }
    }
}

extension AccountView{
    var  modifierView: some View{
        Text("")
    }
}
