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
    @State var showFavortie: Bool = true
    @State var showPast: Bool = false
    @State var showProfile: Bool = false
    
    func getUserInfo() {
        
            let fbhandler = Fbhandler(modelData: User())
            fbhandler.getUserInfo()
        
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
                            Button(action: {showFavortie.toggle()}) {
                                Text("Favorite")
                                    .frame(width: 120, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Image(systemName: "star").foregroundColor(showFavortie ? Color.yellow : Color.black)
                                    
                            }.border(showFavortie ? Color.green : Color.black)
                            .foregroundColor(showFavortie ? .green : .black)
                           
                          
                            Button(action: {showPast.toggle()}) {
                                Text("Past")
                                    .frame(width: 120, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(2)
                                    .foregroundColor(showPast ? Color.blue : Color.black)
                                Image(systemName: "homekit")
                            }.border(showPast ? Color.blue : Color.black)
                            .foregroundColor(showPast ? Color.blue : Color.black)
                            
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
                            
                            Image(systemName: "homekit")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.green)
                        }
                        VStack {
                            Text("Profile")
                                .frame(width: 200, height: 50, alignment: .leading)
                                .foregroundColor(.green)
                            
                            Text("more")
                                .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.green)
                                
                        }
                       
                        Image(systemName: "icloud.and.arrow.up")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.bottom)
                            .foregroundColor(.green)
                        
                    }.padding()
            
        
                
                if showFavortie {
                    
                    VStack {
                        ForEach(0..<favorites.count) { index in
                            FavoriteView(favorite: favorites[index])
                        }

                    }
                    


                }
                if showPast {
                    // show past jobs
                    ForEach(0..<favorites.count) { index in
                        PastView(favorite: favorites[index])
                    }

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
