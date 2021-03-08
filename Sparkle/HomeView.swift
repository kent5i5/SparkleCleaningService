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
                            LoginView(),
                        label: {
                            Text("Sign In")
                               
                        }).padding(.bottom)
                
                    ServiceSelctionsUIView()
                    
                }.edgesIgnoringSafeArea(.top)
                
                
            }.edgesIgnoringSafeArea(.top)
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
    }
}
