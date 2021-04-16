//
//  StartingView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/31/21.
//

import SwiftUI
import CoreData
import Firebase

struct Theme {
 
  let darkGreen  = Color( red: 36/255, green: 106/255, blue: 93/255, opacity: 1)
  let lightGreen = Color( red: 130/255, green: 176/255, blue: 40/255, opacity: 1)
     
    let yellow = Color( red: 236/255, green: 193/255, blue: 89/255, opacity: 1)

}


struct StartingView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @State var selection:String? = nil
    @State var showAnimation = false
    
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
                        Text("Continue")
                            .font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .shadow(color: Color.green.opacity(0.4), radius: 3, x: 1, y: 2)
                            .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
                            .background(theme.darkGreen)
                            .cornerRadius(25)
                            .foregroundColor(.white)
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
//                                Text("Sign Up").font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                    .padding()
//                                    .foregroundColor(.green)
                                
                                Text("Sign Up")
                                    .font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    //.shadow(color: Color.green.opacity(0.4), radius: 3, x: 1, y: 2)
                                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
                                    .background(theme.darkGreen)
                                    .cornerRadius(25)
                                    .foregroundColor(.white)
                            })
                        HStack{
                            Text("Already have an account? ").font(.custom("Times New Roman", size: 12))
                                .foregroundColor(.green)
                            NavigationLink(
                                destination: LoginView(appData: appData).environment(\.managedObjectContext, context)
                                    .environmentObject(modelData).environmentObject(serviceData),
                                label: {
                                    Text("Log in").font(.custom("Times New Roman", size: 12))
                                       .foregroundColor(.green)
                                })
                        }.padding(.bottom, 100)
                        
                        NavigationLink(
                            destination: SelectServiceUIView().environmentObject(modelData).environmentObject(serviceData), label: {
                                
                                Text("Clean Now").font(.custom("Times New Roman", size: 25))
                                    .font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    //.shadow(color: Color.green, radius: 3, x: 1, y: 2)
                                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
                                    .background(theme.lightGreen)
                                    .cornerRadius(25)
                                    .foregroundColor(.white)})
                        Spacer()
                       
                      
                    }
                   
                    
               
                    
                }.opacity((Auth.auth().currentUser == nil) ? 1 : 0)
      
   
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
