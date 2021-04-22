//
//  AcceptCleanerView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI
import Firebase
struct AcceptCleanerView: View {
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @ObservedObject var navigate: serviceNavigator
    @Binding var currentStep: Int
    @State private var isPresented = false
    @State var cleanerList: [Worker] = [ Worker(name: "Ms. Maria W.", price: 240 ,picture: "cleaner-a" , limit: 4, type: "House Cleaning Services", intro: "", isSelected: false)]
    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    func resetView(){
//        print(street + aptunit + zipcode)
        currentStep = 1
//        iconItem.forEach{ icon in
//            if icon.isSelected == true {}
//        }
//        street = ""
//        aptunit = ""
//        zipcode = ""
//        serviceData.startDate = Date()
//        serviceData.endDate = Date()
    }
    
    var body: some View {
        
        
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack {
                        
                        
                        if (!modelData.uid.isEmpty){
                            Spacer()
                            CircleImageView(iconName: "cleaner-a")
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                                .shadow(radius: 12)
                                .overlay(Circle().stroke(Theme.init().darkGreen, lineWidth: 10))
                                .padding()
                            
                            Group {
                                HStack{
                                    Text("").bold()
                                    Spacer()
                                }
                            
                                Text("Ms. Maria W.").font(.title2).padding(3)
                                Text("$20/hr").bold().scaleEffect(2).padding(3)
                                
                                Text("5 YEARS EXPERIENCES & FAST PACED").scaleEffect(0.8)
                                
                               
                                
                                HStack{
                                    Image("kidroom").scaleEffect(0.6)
                                    Image("guestroom").scaleEffect(0.6)

                                    Image("washingmachine").scaleEffect(0.6)
                                    Image("cooking").scaleEffect(0.6)
                                }
                              
                                
                                Button(action: {isPresented.toggle()}){
                                           
                                    Image("cleaner-a").frame(width:300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    
                                       } .fullScreenCover(isPresented: $isPresented, content: videoView.init)
                                        .rotationEffect(.degrees(0))
                                        .padding(.bottom)
                                
                                Text("Rating: ").padding(.bottom, 30)
                                HStack(spacing:0 ) {
                                    Image(systemName: "star").scaleEffect(0.6).opacity(0.6)
                                    Image(systemName: "star").scaleEffect(0.6).opacity(0.6)
                                    Image(systemName: "star").scaleEffect(0.6).opacity(0.6)
                                    Image(systemName: "star").scaleEffect(0.6).opacity(0.6)
                                    Image(systemName: "star").scaleEffect(0.8)
                                    
                                }.foregroundColor(Theme.init().yellow)
                                HStack {
                                    Image("accept").padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)).onTapGesture {
                                        navigate.nextView(nextView: "MemberConfirmView")
                                    }
                                    Image("reject").padding(EdgeInsets(top: 16, leading:16, bottom: 16, trailing: 16)).onTapGesture {
                                        navigate.nextView(nextView: "SelectCleanerView")
                                    }
                                }
                               // WorkerView(userName: cleanerList[0].name, userPicture: cleanerList[0].picture, isSelected: $cleanerList[0].isSelected)
                            }
                           
                            Spacer()
        //                    Text("").toolbar {
        //                        ToolbarItem(placement: .bottomBar) {
        //                            HStack{
        //                                Button(action: {previousView()}){
        //                                    Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
        //                                }.offset(x: 20, y: 0)
        //                                Spacer()
        //                                Button(action: {navigate.nextView(nextView: "MemberConfirmView")}){
        //                                                        //Image("chevron-top")
        //                                                        Text("NEXT")
        //                                                            .foregroundColor(.white)
        //                                                                .padding()
        //                                                                .cornerRadius(8)
        //                                                     }.frame(maxWidth: .infinity, maxHeight: .infinity)
        //
        //                                Button(action: {navigate.nextView(nextView: "MemberConfirmView")}){
        //                                    Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
        //                                }.offset(x: -20, y: 0)
        //                            }.background(Theme.init().darkGreen)
        //                            .frame(width: geometry.size.width, alignment: .top)
        //                        }
        //                    }
                    
                          
                        }
                        if (modelData.uid.isEmpty) {
                            GeometryReader { geometry in
                                Text("Your cleaner has been selected")
                                WorkerView(userName: cleanerList[0].name, userPicture: cleanerList[0].picture, isSelected: $cleanerList[0].isSelected)
                                Text("").toolbar {
                                    ToolbarItem(placement: .bottomBar) {
                                        HStack{
                                            Button(action: {previousView()}){
                                                Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                                            }.offset(x: 20, y: 0)
                                            Spacer()
                                            Button(action: {resetView()}){
                                                                    //Image("chevron-top")
                                                                    Text("CONFIRM")
                                                                        .foregroundColor(.white)
                                                                            .padding()
                                                                            .cornerRadius(8)
                                                                 }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                            
                                      
                                        }.background(Theme.init().darkGreen)
                                        .frame(width: geometry.size.width, alignment: .top)
                                    }
                                }//toolbar
                            }//geometry
                            
                        }
                 
                    }.foregroundColor(Theme.init().darkGreen)
                }
                
                Image(systemName: "x").background(Color.gray).padding()
                
            
        }//ZStack
        

    } //body
}

//struct AcceptCleanerView_Previews: PreviewProvider {
//    static var previews: some View {
//        AcceptCleanerView()
//    }
//}
