//
//  ContentView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
            UITabBar.appearance().backgroundColor = UIColor(Color(red: 10/255, green: 255/255, blue: 10/255))
    }
    var body: some View {
        NavigationView {
            TabView {

                
                HomeView().tabItem {
                    Image(systemName:"homekit")
                        .resizable()

                }
                
                CalenderUIView().tabItem {
                    Image(systemName: "plus.message.fill")
                        .resizable()
                        .background(Color.green)
                }
                
                
                ProfileUIView().tabItem {
                    Image(systemName: "xserve")
                }.ignoresSafeArea()
                
                WorkerListUIView().tabItem {
                    Image(systemName: "pencil.tip")
                }
                
            }.edgesIgnoringSafeArea(.top)
            .accentColor(.green)
        }

         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
            
    }
}
