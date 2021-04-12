//
//  StartingView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/31/21.
//

import SwiftUI
import CoreData
import Firebase

struct StartingView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @State var selection:String? = nil
    @State var showAnimation = false
    var body: some View {
        
         NavigationView() {
            VStack {
                Image("sparkle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .rotationEffect(.degrees( showAnimation ? 360 : 0))
                                    .scaleEffect( showAnimation ? 1.1 : 1)
                                    .animation(.spring())
                    .onAppear(){
                        showAnimation = true
                    }
                
                if Auth.auth().currentUser != nil{
                    NavigationLink( "",
                                    destination: ContentView(appData: appData).environmentObject(modelData)
                                        .environmentObject(serviceData),
                                    tag: "A", selection: $selection).animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/).transition(.scale)
                    
                    Button(action:{
                        withAnimation(.spring()){
                            selection = "A"
                        }
                        
                    }){
                        Text("Continue").font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding().foregroundColor(.green)
                    }
                }
                
                
                    
                VStack {
                    HStack {
                       
                        NavigationLink(
                            destination: SelectServiceUIView().environmentObject(modelData).environmentObject(serviceData), label: {
                                
                                Text("Order a services").font(.custom("Times New Roman", size: 25))
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding()
                                        .foregroundColor(.green)
            
                                       //.shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.1)
                                    
                               
                        })
                    }
                    
                    NavigationLink(
                        destination: LoginView(appData: appData).environment(\.managedObjectContext, context)
                            .environmentObject(modelData).environmentObject(serviceData),
                        label: {
                            Text("Sign in").font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                                .foregroundColor(.green)
                        })
                    
                }.opacity((Auth.auth().currentUser == nil) ? 0.8 : 0)
      
   
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
