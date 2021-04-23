//
//  SelectCleanerView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct SelectCleanerView: View {
    
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @EnvironmentObject var workerData: WorkerRepository
    
    @ObservedObject var navigate: serviceNavigator
    @Binding var selectedUser: Worker
    
//    @State var cleanerList: [Worker] = [ Worker(name: "Ms. Maria W.",price: 240,picture: "cleaner-a" , limit: 4, type: "House Cleaning Services", intro: "", isSelected: false),
//                                         Worker(name: "Ms. Cheung" ,price: 240, picture: "cleaner-b" ,limit: 3, type: "House Cleaning Services", intro: "", isSelected: false),
//                                         ]
    @ObservedObject var workerlist: WorkerRepository
    
//    @Binding var fullname: String
//    @Binding var phone: String
//    @Binding var currentStep: Int
//    @Binding var street: String
//    @Binding var aptunit: String
//    @Binding var zipcode: String
//    @Binding var totalhours: Int
//    @Binding var start: Date
//    @Binding var iconItem: [Icon]
//    @Binding var iconItem2: [Icon]
    
    //var workers : [Worker]
    

    func resetView(){
        //currentStep = 1

    }
    
    var body: some View {
//        GeometryReader { geometry in
//            Text("").toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    HStack{
//                        Button(action: {previousView()}){
//                            Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
//                        }.offset(x: 20, y: 0)
//                        Spacer()
//                        Button(action: {nextView()}){
//                                                //Image("chevron-top")
//                                                Text("NEXT")
//                                                    .foregroundColor(.white)
//                                                        .padding()
//                                                        .cornerRadius(8)
//                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
//
//                        Button(action: {nextView()}){
//                            Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
//                        }.offset(x: -20, y: 0)
//                    }.background(Theme.init().darkGreen)
//                    .frame(width: geometry.size.width, alignment: .top)
//                }
//            }
//        }
        VStack {
            if (!modelData.uid.isEmpty){
               
                Text("Select a cleaner")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(EdgeInsets(top:8, leading: 16,
                                         bottom:60, trailing:0 ))
                //Text("number of worker found \(self.workerData.workers.description)" )
        
                LazyVStack{
                    HStack{
                        Text("").bold().navigationBarHidden(true)
                        Spacer()
                    }
                    ScrollView {
                        ForEach(self.workerData.workers){ worker in
//                            NavigationLink(
//                                destination:  MemberConfirmView(navigate: navigate)
//
//                            ){ }
                            
                            
                            WorkerView(userName: worker.name, userPicture: worker.picture, intro: worker.intro).onTapGesture {
                                workerData.selectedWorker = worker
                                navigate.nextView(nextView: "MemberConfirmView")
                            }
                            
                        }
                    }
                
                    
                    
//                    if cleanerList[0].isSelected {
//                        WorkerView(userName: cleanerList[0].name, userPicture: cleanerList[0].picture, isSelected: $cleanerList[0].isSelected)
//                    }
                    
//                    WorkerView(userName: cleanerList[1].name , userPicture: cleanerList[1].picture, isSelected: $cleanerList[1].isSelected)
//                        .overlay(cleanerList[1].isSelected ? Rectangle() : nil).onTapGesture {
//                            navigate.nextView(nextView: "AcceptCleanerView")
//                        }
                    
                }
               
                Spacer()
              
            }
            if (modelData.uid.isEmpty) {
                Text("We have found a cleaner for you").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    .padding(EdgeInsets(top:8, leading: 16, bottom:60, trailing:0 ))
                //WorkerView()
                
                VStack {
                    CircleImageView(iconName: selectedUser.picture).frame(width: 160, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("\(selectedUser.price)" + "/ \(selectedUser.limit) hrs").bold()
                    Text("Rating ******").bold()
                    
                    HStack {
                        Image("accept").onTapGesture {
                            navigate.nextView(nextView: "newCustomerConfirmView")
                        }
                        Image("reject")
                    }
                }.foregroundColor(Theme.init().darkGreen)
                //.frame(minHeight: 600)
                
                
               
                Spacer()
                
                ReviewView(userPicture: "client-c", userName: "", content: "She is good")
                    .background(Theme.init().darkGreen)
                    //.frame(height: .infinity)
               
            }
            
            
     
        }.foregroundColor(Theme.init().darkGreen)
    }
}

//struct SelectCleanerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectCleanerView()
//    }
//}
