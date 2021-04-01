//
//  StartingView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/31/21.
//

import SwiftUI

struct StartingView: View {
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    var body: some View {
         NavigationView {
            VStack {
                Text("Sparkle").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                HStack {
                    Image(systemName: "chevron-right")
                NavigationLink(
                    destination: SelectServiceUIView().environmentObject(modelData).environmentObject(serviceData), label: {
                        
                            Text("Open an application for elder services")
                                .padding()
                                .foregroundColor(.green)
    
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.1)
                            
                       
                })
                }
                NavigationLink(
                    destination: LoginView(appData: appData).environmentObject(modelData).environmentObject(serviceData),label: {
                        Text("Or Login in with membership")
                            .padding()
                            .foregroundColor(.green)

                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.1)
                    })
                
                
            }
            
            
        }
    }
}

struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView(appData: user)
            .previewDevice("iPhone 11")
            .environmentObject(User())
    }
}
