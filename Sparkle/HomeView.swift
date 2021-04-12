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
    @State var tag:Int? = nil
    
    func getUserInfo(){

        let fbhandler = Fbhandler(modelData: modelData)
        fbhandler.getUserInfo()
          //appData.setName(name: email!)
    }
    
    func signOut(){
        let auth = Auth.auth()
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        //appData.name = ""
        modelData.name = ""
    }
    
    var body: some View {
        
        VStack {
            
               
                    
                    Image(systemName: "")
                        .resizable()
                        .frame( height: 280, alignment: .center)
                        .background(Color.green)
                ScrollView {
                    VStack {
                    if (modelData.name.isEmpty) {
                        Text("Welcome!")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                            .foregroundColor(.green)
  
                        NavigationLink(
                            destination:
                                LoginView(appData: appData).environmentObject(User()).onDisappear() {
                                   //print("back from login view")
                                    getUserInfo()
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
                        
                    
//                        NavigationLink(destination: StartingView(appData:appData)
//                                        .environment(\.managedObjectContext, context)
//                                        .environmentObject(modelData)
//                                        .environmentObject(serviceData),
//                                       tag: 1, selection: $tag) {}
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
                    

                    ServiceSelctionsUIView().environmentObject(modelData)
                    
                 
                    Button("Present!") {
                               isPresented.toggle()
                           }
                           .fullScreenCover(isPresented: $isPresented, content: videoView.init)
                            .rotationEffect(.degrees(0))
                    
                }.edgesIgnoringSafeArea(.top)
                .onAppear(){getUserInfo() }
                
                
            }.edgesIgnoringSafeArea(.top)
            
        }
        //.navigationViewStyle(StackNavigationViewStyle())
//        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User()
        HomeView(appData: user)
            .previewDevice("iPhone 11")
    }
}
