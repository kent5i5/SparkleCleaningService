//
//  ContentView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    init(appData: User) {
            UITabBar.appearance().backgroundColor = UIColor(Color(red: 10/255, green: 255/255, blue: 10/255))
        //UINavigationBar.appearance().backgroundColor = .green
        self.appData = User()
        
    }
    var body: some View {
        NavigationView {
            VStack {
//                Text("")
//                    .navigationBarTitleDisplayMode(.automatic)
//                            .toolbar { // <2>
//                                ToolbarItem(placement: .principal) { // <3>
//                                    VStack {
//                                        Text("Title").font(.headline)
//                                        Text("Subtitle").font(.subheadline)
//                                    }
//                                }
//                        }
                    
            
            TabView {

                
                HomeView(appData: appData).tabItem {
                    Image(systemName:"homekit")
                        .resizable()

                }.ignoresSafeArea()
                .navigationBarHidden(true)
                .environmentObject(modelData)
                
                CalenderUIView().tabItem {
                    Image(systemName: "plus.message.fill")
                        .resizable()
                        .background(Color.green)
                }.edgesIgnoringSafeArea(.top)
                .navigationBarHidden(true)
                
                
                ProfileUIView().tabItem {
                    Image(systemName: "xserve")
                }.navigationBarHidden(true)
                .environmentObject(modelData)
                
                WorkerListUIView().tabItem {
                    Image(systemName: "pencil.tip")
                }.navigationBarHidden(true)
                .environmentObject(modelData)
                .environmentObject(serviceData)
                
            }.edgesIgnoringSafeArea(.top)
            .accentColor(.green)
            }.onAppear(){
                // retrieve user data from firestore
                let fbhandler = Fbhandler(modelData: modelData)
                fbhandler.getUserInfo()
            }
        }.navigationViewStyle(StackNavigationViewStyle())

         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User()
        ContentView(appData: user)
            .previewDevice("iPhone 11")
            .environmentObject(User())
    }
}
