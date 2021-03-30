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
        
        ScrollView {
            VStack {
                    VStack {
                        Text("My HouseKeeper")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .foregroundColor(.green)
                        HStack {
                            Button(action: {showFavortie.toggle()
                                showPast.toggle()
                            }) {
                                Text("Favorite")
                                    .frame(width: 120, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Image(systemName: "star").foregroundColor(showFavortie ? Color.yellow : Color.black)
                                    
                            }.border(showFavortie ? Color.green : Color.black)
                            .foregroundColor(showFavortie ? .green : .black)
                           
                          
                            Button(action: {
                                    showPast.toggle()
                                    showFavortie.toggle()
                                
                            }) {
                                Text("Past")
                                    .frame(width: 120, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(2)
                                    .foregroundColor(showPast ? Color.blue : Color.black)
                                Image(systemName: "plus")
                            }.border(showPast ? Color.blue : Color.black)
                            .foregroundColor(showPast ? Color.green : Color.black)
                            
                        }
                    }
                    HStack {
                        
                        VStack {
                            Image(systemName: "message.circle.fill")
                                .resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.green)
                                .onTapGesture {
                                    showProfile.toggle()
                                }.sheet(isPresented: $showProfile){
                                    AccountView()}
                                
                        
                                Text("Profile")
                                    //.frame(width: 200, height: 50, alignment: .bottom)
                                    .foregroundColor(.green)
//                            Image(systemName: "homekit")
//                                .resizable()
//                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                .foregroundColor(.green)
                        }
                        VStack {
                            
                            
                            Text("filter")
                                .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.green)
                                
                        }
                       
//                        Image(systemName: "icloud.and.arrow.up")
//                            .resizable()
//                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .padding(.bottom)
//                            .foregroundColor(.green)
                        
                    }.padding()
            
        
                
                if showFavortie {
                    
                    VStack {
                        Text("Favorite Jobs").font(.headline)
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
               
            }.padding(0)
            .onAppear(){getUserInfo()}
        }
    }
}

struct WorkerListUIView_Previews: PreviewProvider {
    static var previews: some View {
        WorkerListUIView()
    }
}
