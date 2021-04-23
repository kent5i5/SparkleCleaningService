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
    @EnvironmentObject var workerData: WorkerRepository
    
    @State var selection:String? = nil
    @State var showAnimation = false
    @ObservedObject var navigate = serviceNavigator(currentView: "HowToContactView",  firstView: "HowToContactView")
    let theme = Theme()

    
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
                    Spacer()
                    Button(action:{
                        withAnimation(.spring()){
                            selection = "A"
                        }
                        
                    }){
                        Text("Continue").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .sparklefilledbutton()

                    }.offset(y: 40)
                }
                
                
                    
                VStack {
                   
                    VStack {
                        Spacer()
                        NavigationLink(
                            destination: RegisterView().environmentObject(modelData),
                                //LoginView(appData: appData).environment(\.managedObjectContext, context)
                                //.environmentObject(modelData).environmentObject(serviceData),
                            label: {
                                
                                Text("Sign Up").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .sparklefilledbutton()
                            })
                        HStack{
                            Text("Already have an account? ").font(.custom("Times New Roman", size: 13))
                                
                            NavigationLink(
                                destination: LoginView(appData: appData).environment(\.managedObjectContext, context)
                                    .environmentObject(modelData).environmentObject(serviceData),
                                label: {
                                    Text("Log in").font(.custom("Times New Roman", size: 13))
                                       
                                })
                        }.padding(.bottom, 100)
                        
                        NavigationLink(
                            destination: SelectServiceUIView(navigate: navigate, workerlist: WorkerRepository() )
                                .environmentObject(modelData)
                                .environmentObject(serviceData)
                                .environmentObject(workerData), label: {
                                
                                Text("Clean Now").font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .sparklefilledlightbutton()
                                    
                                })
                        Spacer()
                       
                      
                    }
                   
                    
               
                    
                }.opacity((Auth.auth().currentUser == nil) ? 1 : 0)
                .foregroundColor(theme.darkGreen)
   
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
