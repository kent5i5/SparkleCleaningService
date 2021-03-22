//
//  HomeView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @State private var isPresented = false
    @State var password: String = ""
    
    func getUserInfo(){
    
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
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    Image(systemName: "")
                        .resizable()
                        .frame( height: 280, alignment: .center)
                        .background(Color.green)
                        
                    if (modelData.name.isEmpty) {
                        Text("Welcome!")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                            .foregroundColor(.green)
  
                        NavigationLink(
                            destination:
                                LoginView(appData: appData).environmentObject(User()).onDisappear() {
                                   print("back from login view")
                                },
                            label: {
                                Text("Sign In")

                            }).padding(.bottom)
                    } else {
                        Text("Welcome: " + modelData.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                            .foregroundColor(.green)
                        Button(action:  {
                           signOut()
                        }) {
                            HStack {
                                Text("Sign Out")
                            
                            }
                        }
                    }
                    

                
                    
                    TextField("Search", text: .constant(""))
                        .frame(width: 300, height: 20, alignment: .center)
                        .cornerRadius(10)
                        .padding()
                        .border(Color.green)
                    

                    ServiceSelctionsUIView()
                    
                    NavigationLink(
                        destination:
                            videoView(),
                        label: {
                            Text("Video")
                               
                        }).padding(.bottom)
                    
                 
                    Button("Present!") {
                               isPresented.toggle()
                           }
                           .fullScreenCover(isPresented: $isPresented, content: videoView.init)
                    
                }.edgesIgnoringSafeArea(.top)
                .onAppear(){getUserInfo() }
                
                
            }.edgesIgnoringSafeArea(.top)
            
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User()
        HomeView(appData: user)
            .previewDevice("iPhone 11")
    }
}
