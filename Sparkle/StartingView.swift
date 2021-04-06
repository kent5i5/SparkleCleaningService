//
//  StartingView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/31/21.
//

import SwiftUI
import CoreData

struct StartingView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @EnvironmentObject var serviceData: ServiceRepository
    

    var body: some View {
        
         NavigationView {
            VStack {
                Image("sparkle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                HStack {
                   
                    NavigationLink(
                        destination: SelectServiceUIView().environmentObject(modelData).environmentObject(serviceData), label: {
                            
                                Text("Open an application for elder services")
                                    .padding()
                                    .foregroundColor(.green)
        
                                   //.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.1)
                                
                           
                    })
                }
                NavigationLink(
                    destination: LoginView(appData: appData).environment(\.managedObjectContext, context)
                        .environmentObject(modelData).environmentObject(serviceData),label: {
                        Text("Or Login in with membership")
                            .padding()
                            .foregroundColor(.green)
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
