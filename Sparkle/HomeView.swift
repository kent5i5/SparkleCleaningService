//
//  HomeView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI
import Firebase


struct Worker: Identifiable {
  let id = UUID()
  let name: String
    let picture: String
  var isSelected: Bool

}

struct Reviewer: Identifiable {
  let id = UUID()
    let userPicture: String
  let userName: String
  var content: String

}

struct HomeView: View {
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @State private var isPresented = false
    @State var password: String = ""
    @State var tag:Int? = nil
    
    @State private var position = 0
    
    @State var clientList: [Reviewer] = [ Reviewer(userPicture: "client-a", userName: "Kate Yang" , content: "As user completed their service request, user  can share their   experience in order to receive discount. "),
                                          Reviewer(userPicture: "client-b", userName: "Jimmy Morgan" , content: ""),
                                          Reviewer(userPicture: "client-c", userName:  "Karen Thomas" , content: "") ]
    
    @ObservedObject var navigate = serviceNavigator(currentView: "SelectServiceSubView", preView: "", firstView: "SelectServiceSubView")
    let theme = Theme()
    func getUserInfo(){

        let fbhandler = Fbhandler(modelData: modelData)
        fbhandler.getUserInfo()
          //appData.setName(name: email!)
    }
    
    func signOut(){
        let auth = Auth.auth()
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        //appData.name = ""
        modelData.name = ""
    }
    
    var body: some View {
        
        VStack {
            
               
            GeometryReader { geometry in
                VStack{
                    ZStack(alignment: .bottomTrailing) {
                        ScrollView(.horizontal, showsIndicators: true){
                            ScrollViewReader { proxy in
                                LazyHStack{
     
//                                    ForEach(0..<3) { index in
//                                            Text(String(index))
//                                                .id(index)
//                                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                
                                   
                            Image( "Mask Group 1")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                .id(0)
                            Image( "Mask Group 2")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                .id(1)
//                            Image("andrea-piacquadio-3")
//                                .resizable()
//                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
//                                .id(2)
                                    
                                }.onChange(of: position) { value in
                                    withAnimation {
                                        proxy.scrollTo(value, anchor: .center)
                                        
                                    }
                                }
                            }
                            //.frame(width: geometry.size.width, height: 500, alignment: .center)
                          
                            
                        }.background(Color.green)
                        
                   
                    
                        HStack{
                            Button(action: { position =  0}){
                                Circle().frame(width: 10, height: 10, alignment: .center)
                            }
                            Button(action: { position =  1 }){
                                Circle().frame(width: 10, height: 10, alignment: .center)
                            }
//                            Button(action: { position = 2 }){
//                                Circle().frame(width: 10, height: 10, alignment: .center)
//                            }
                        }.padding()
                    }
                }.offset(y: 10)
                
            }
        
                    
                ScrollView {
                    VStack() {
                    if (modelData.name.isEmpty) {
                        Text("Hey")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                            .foregroundColor(theme.darkGreen)
  
                        NavigationLink(
                            destination:
                                LoginView(appData: appData).environmentObject(User()).onDisappear() {
                                   //print("back from login view")
                                    getUserInfo()
                                },
                            label: {
                                Text("Sign In")

                            }).padding(.bottom)
                    } else {
                        HStack {
                            VStack {
                                Text("Hey " + modelData.name + ",")
                                    .font(.custom("Times New Roman", size: 24))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .offset(x: 24)
                                    //.frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
        
                                Text("What can we help? ").font(.custom("Times New Roman", size: 24)).offset(x: 30)
                                
                                Text("").frame(height:30)
                                
                            }.foregroundColor(theme.darkGreen)
                           
                            Spacer()
                            
                        }
            
//                        NavigationLink(destination: StartingView(appData:appData)
//                                        .environment(\.managedObjectContext, context)
//                                        .environmentObject(modelData)
//                                        .environmentObject(serviceData),
//                                       tag: 1, selection: $tag) {}
                        
                    }
                    

                
                    
                        TextField("Search", text: .constant(""))
                            .frame(width: 300, height: 28, alignment: .center)
                            .cornerRadius(25)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(lineWidth: 2))
                        Text("").frame(height:30)
                        NavigationLink(destination: SelectServiceUIView(navigate: navigate)) {
                            Text("Book A Cleaner")
                                .font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .shadow(color:  theme.darkGreen, radius: 3, x: 1, y: 2)
                                .frame(width: 300, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
                                .background( theme.darkGreen)
                                .cornerRadius(25)
                                .foregroundColor(.white)
                        }
                        Text("").frame(height:30)
                        
                        Text("Tips to keep house clean >> ").font(.custom("Times New Roman", size: 18)).offset(x: -60)
                        
                        //ServiceSelctionsUIView(navigate: navigate).environmentObject(modelData)
                        
                    Spacer().padding(.bottom, 40)
                    
                      
                       
                        Group{
                            HStack {
                                Text("Our Green Cleaning Services >>").font(.custom("Times New Roman", size: 18)).padding(.leading, 60)
                                Spacer()
                            }
                            Image("Mask Group 18").padding(.bottom, 30)
                            Image("Mask Group 20").padding(.bottom, 30)
                            Image("Mask Group 22").padding(.bottom, 30)
                            
                            HStack {
                                Text("Find a houseKeeper now?").font(.custom("Times New Roman", size: 18)).padding(.leading, 60)
                                Spacer()
                            }
                            
                            
                            TextField("Search", text: .constant(""))
                                .frame(width: 300, height: 28, alignment: .center)
                                .cornerRadius(25)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
                                .overlay(RoundedRectangle(cornerRadius: 30)
                                            .stroke(lineWidth: 2))
                            
                            VStack{
                                ReviewView(userPicture: clientList[0].userPicture, userName: clientList[0].userName, content: clientList[0].content)

                                ReviewView(userPicture: clientList[1].userPicture,  userName: clientList[1].userName , content:  clientList[1].content)
                                
                                ReviewView(userPicture: clientList[2].userPicture, userName: clientList[2].userName , content: clientList[2].content)
                                
                            }.padding(.top, 30)
                            
                        }
                       
                  
                        
                }.onAppear(){getUserInfo() }
                    .padding(.bottom)
                
                
            }//.edgesIgnoringSafeArea(.top)
            
        }.foregroundColor(theme.darkGreen)
        .padding()
        //.navigationViewStyle(StackNavigationViewStyle())
//        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User()
        HomeView(appData: user)
            .previewDevice("iPhone 11")
    }
}
