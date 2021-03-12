//
//  HomeView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var appData: User
    @State private var isPresented = false
    @State var password: String = ""
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    Image(systemName: "")
                        .resizable()
                        .frame( height: 280, alignment: .center)
                        .background(Color.green)
                        
                        

                    Text("Welcome!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .foregroundColor(.green)
                
                    
                    TextField("Search", text: .constant(""))
                        .frame(width: 300, height: 20, alignment: .center)
                        .cornerRadius(10)
                        .padding()
                        .border(Color.green)
                    
                    
                    
                    NavigationLink(
                        destination:
                            LoginView(appData: appData),
                        label: {
                            Text("Sign In")

                        }).padding(.bottom)

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
                
                
            }.edgesIgnoringSafeArea(.top)
            
        }.navigationViewStyle(StackNavigationViewStyle())
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User()
        HomeView(appData: user)
            .previewDevice("iPhone 11")
    }
}
