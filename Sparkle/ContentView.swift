//
//  ContentView.swift
//  Sparkle
//  Content View contains all tabs items and display 4 main Views 
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @State var selection: Int = 0
    
    init(appData: User) {
        //UINavigationBar.setAnimationsEnabled(false)
        //UINavigationBar.animate(withDuration: 0.1, animations:{ })
        UITabBar.appearance().backgroundColor = UIColor(Color(red: 36/255, green: 106/255, blue: 93/255, opacity: 1) )
        UITabBar.appearance().barTintColor = UIColor(Theme.init().darkGreen)
        //UINavigationBar.appearance().backgroundColor = .green
        self.appData = User()
        
        
    }
    var body: some View {
            VStack {

            TabView(selection: $selection) {

                
                HomeView(appData: appData).tabItem {
                    
                    selection == 0 ? Image("Home-selected").resizable() : Image("home").resizable()
                    //Text("home").font(.caption2)
                }.tag(0)//.ignoresSafeArea()
               
                
                CalenderUIView().tabItem {
                   
                    selection == 1 ? Image( "calendar-1").resizable() : Image("calendar").resizable()
                                        
                }.tag(1)//.edgesIgnoringSafeArea(.top)
                .navigationBarHidden(true)
                
                WorkerListUIView().tabItem {
                    selection == 2 ? Image("my-cleaner-selected").resizable() : Image("my-cleaner").resizable()
                    //Text("Profile").font(.caption2)
                }.tag(2).navigationBarHidden(true)
           
                
                ProfileUIView().tabItem {
                   
                    selection == 3 ? Image("my-profile-selected").resizable() : Image("my-profile").resizable()
                    //Text("Settings").font(.caption2)
                }.tag(3).navigationBarHidden(true)
        
                
               
                
            }.edgesIgnoringSafeArea(.top)
            .accentColor(Theme.init().darkGreen)
            }.onAppear(){
                // retrieve user data from firestore
                let fbhandler = Fbhandler(modelData: modelData)
                fbhandler.getUserInfo()
            }.navigationBarBackButtonHidden(true)
            
        }//.navigationViewStyle(StackNavigationViewStyle())
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User()
        ContentView(appData: user)
            .previewDevice("iPhone 11")
            .environmentObject(User())
    }
}
