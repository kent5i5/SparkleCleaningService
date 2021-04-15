//
//  WorkerListUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI
import AVKit

let favorites: [Favorite] = [ Favorite(name: "job1", duration: 5.0),
                             Favorite(name: "job2", duration: 5.0),
                             Favorite(name: "job3", duration: 5.0)
]

struct WorkerListUIView: View {
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @State var showFavortie: Bool = true
    @State var showPast: Bool = false
    @State var showProfile: Bool = false
    
    @State var servicelist: [Service] = []
    func getUserInfo() {
        
            let fbhandler = Fbhandler(modelData: User())
            fbhandler.getUserInfo()
        
        // if user is logged in, retrieve their services history
        if !modelData.uid.isEmpty{
            serviceData.getServicelists(uid: modelData.uid)
           // print(serviceData.serivces)
        }
        
        
    }
    
    var body: some View {
        
      
            VStack {
                VStack(spacing: 0) {
                        
                        HStack {
                            Text("My Cleaners ").frame( alignment: .leading).font(.title).foregroundColor(.green)
                            Spacer()
                        }.padding(EdgeInsets(top:8, leading: 16,
                                             bottom:60, trailing:0 ))
                        
                        
                        
                        HStack(spacing: 0) {
                            Button(action: {showFavortie.toggle()
                                showPast.toggle()
                            }) {
                                Text("Favorite")
                                    .frame(width: 185, height: 50, alignment: .center)
                                Image(systemName: "star").foregroundColor(showFavortie ? Color.yellow : Color.black)
                                    
                            }.border(showFavortie ? Color.green : Color.black)
                            .background(showFavortie ? Color.gray : Color.white)
                            .foregroundColor(showFavortie ? .white : .gray)
                            
                           
                          
                            Button(action: {
                                    showPast.toggle()
                                    showFavortie.toggle()
                                
                            }) {
                                Text("Past")
                                    .frame( width: 185, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    
                                Image(systemName: "arrow-up")
                            }.border(showPast ? Color.green : Color.black)
                            .background(showPast ? Color.gray : Color.white)
                            .foregroundColor(showPast ? .white : .gray)
                            
                        }
                    }.offset(x: 0, y: 13)
//                    HStack {
//
//                        VStack {
//                            Image(systemName: "message.circle.fill")
//                                .resizable()
//                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                .foregroundColor(.green)
//                                .onTapGesture {
//                                    showProfile.toggle()
//                                }.sheet(isPresented: $showProfile){
//                                    AccountView()}
//
//
//                                Text("Profile").foregroundColor(.green)
//                            Image(systemName: "homekit")
//                                .resizable()
//                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                .foregroundColor(.green)
//                        }
//
//
//
//
//                    }.padding()
            
        
            ScrollView {
                VStack{
                    if showFavortie {
                        
                        VStack {
                           // Text("Favorite Cleaners").font(.headline)
                            ForEach(0..<favorites.count) { index in
                                FavoriteView(favorite: favorites[index])
                            }

                        }
                        


                    }
                    if showPast {
                        // show past jobs
                        //ForEach(0..<favorites.count) { index in
                        Text("History").font(.headline)
                            PastView()
                                .environmentObject(modelData)
                                .environmentObject(serviceData)
                       // }

                    }
                }
            }
            .onAppear(){getUserInfo()}
        }
    }
}

struct WorkerListUIView_Previews: PreviewProvider {
    static var previews: some View {
        WorkerListUIView()
    }
}
