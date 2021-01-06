//
//  HomeView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct HomeView: View {
    @State var password: String = ""
    
    var body: some View {
        
        ScrollView {
            VStack {
                Image(systemName: "")
                    .resizable()
                    .frame( height: 280, alignment: .center)
                    .background(Color.green)
                    .padding(0)
                    

                Text("Hello, Marry!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundColor(.green)
            
                
                TextField("Search", text: .constant(""))
                    .frame(width: 300, height: 20, alignment: .center)
                    .cornerRadius(10)
                    .padding()
                    .border(Color.green)
                
 
                
                VStack {
                    HStack {
                        Image(systemName: "applescript")
                            .resizable()
                            .padding(10)
                            .frame(width: 100, height: 100, alignment: .topLeading)
                            
                        
                        Image(systemName: "homekit")
                            .resizable()
                            .padding(10)
                            .frame(width: 100, height: 100, alignment: .topLeading)
                        
                        Image(systemName: "homekit")
                            .resizable()
                            .padding(10)
                            .frame(width: 100, height: 100, alignment: .topLeading)
                    }
                  
                }
                
                HStack {
                    Image(systemName: "homekit")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    Image(systemName: "homekit")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    Image(systemName: "homekit")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                }
               
                
            }.padding(0)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
    }
}
