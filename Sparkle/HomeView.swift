//
//  HomeView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var modelData: User
    @ObservedObject var appData: User
    @State private var isPresented = false
    @State var password: String = ""
    @State var tag:Int? = nil
    
    @State private var position = 0
    
    @State var cleanPicture: [String] = [ "cleaner-a" , "cleaner-b" ,""]
    
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
                    
                        ScrollView(.horizontal, showsIndicators: true){
                            ScrollViewReader { proxy in
                                LazyHStack{
     
//                                    ForEach(0..<3) { index in
//                                            Text(String(index))
//                                                .id(index)
//                                    }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                
                            Image( "andrea-piacquadio-1")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                .id(0)
                            Image( "andrea-piacquadio-2")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                .id(1)
                            Image("andrea-piacquadio-3")
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                .id(2)
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
                        Button(action: { position = 2 }){
                            Circle().frame(width: 10, height: 10, alignment: .center)
                        }
                    }.padding(.bottom, 10)
                }
                
            }
        
                    
                ScrollView {
                    VStack() {
                    if (modelData.name.isEmpty) {
                        Text("Welcome!")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                            .foregroundColor(.green)
  
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
                        Text("Welcome: " + modelData.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                            .foregroundColor(.green)
                        
                    
//                        NavigationLink(destination: StartingView(appData:appData)
//                                        .environment(\.managedObjectContext, context)
//                                        .environmentObject(modelData)
//                                        .environmentObject(serviceData),
//                                       tag: 1, selection: $tag) {}
                        
                    }
                    

                
                    
                    TextField("Search", text: .constant(""))
                        .frame(width: 300, height: 20, alignment: .center)
                        .cornerRadius(10)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 30)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.green))
                    

                    ServiceSelctionsUIView().environmentObject(modelData)
                        
                        Spacer().padding(.bottom, 60)
                    
                        
                        WorkerView(userPicture: $cleanPicture[0])
                        
                        WorkerView(userPicture: $cleanPicture[1])
                        //WorkerView(userPicture: <#T##Binding<String>#>)
                        WorkerView(userPicture: $cleanPicture[2])
                  
                        Spacer().frame(height:100)
                }.onAppear(){getUserInfo() }
                    .padding(.bottom)
                
                
            }//.edgesIgnoringSafeArea(.top)
            
        }
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
