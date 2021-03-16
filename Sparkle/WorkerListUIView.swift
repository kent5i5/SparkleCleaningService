//
//  WorkerListUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI
import AVKit


struct WorkerListUIView: View {
    var body: some View {
        
        ScrollView {
            VStack {
                    VStack {
                        Text("My HouseKeeper")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .foregroundColor(.green)
                        HStack {
                            HStack {
                                Text("Favorite")
                                    .frame(width: 120, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Image(systemName: "homekit")
                                    
                            }.background(Color.green)
                           
                          
                            HStack {
                                Text("Past")
                                    .frame(width: 120, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(2)
                                    
                                Image(systemName: "homekit")
                            }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.green)
                            
                        }
                    }
                    HStack {
                        
                        VStack {
                            Image(systemName: "message.circle.fill")
                                .resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.green)
                            
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
                
               
            }.padding(0)
            
        }
    }
}

struct WorkerListUIView_Previews: PreviewProvider {
    static var previews: some View {
        WorkerListUIView()
    }
}
