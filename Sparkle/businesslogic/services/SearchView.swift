//
//  SearchView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct SearchView: View {
   
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @EnvironmentObject var workerData: WorkerRepository
    
    @ObservedObject var navigate: serviceNavigator
    @ObservedObject var workerlist: WorkerRepository
    @Binding var selectedUser: Worker

    @Binding var additioalInformation: String
    
    @Binding var fullname: String
    @Binding var phone: String
    @Binding var street: String
    @Binding var aptunit: String
    @Binding var zipcode: String
    @Binding var totalhours: Int
    @Binding var start: Date
    @Binding var iconItem: [Icon]
    @Binding var iconItem2: [Icon]
    
    @State private var selectedNone = false
    @State var goToNextView: Int? = 0
    @State var isSearching = false
    @State var typeArray: [String] = []
    
    func startSearch(){
        self.isSearching = true
        if modelData.uid.isEmpty {
                /*
                 Black Box  - Algorithm that find the best cleaner for the customer
                 */
            
            let group = DispatchGroup()
            group.enter()
            //DispatchQueue.main.async() {
                workerData.findTheWorker() { isSucceeded in
                    
                    // Only leave when dispatchGroup returns the escaping bool
                    
                    if isSucceeded {
                        group.leave()
                    } else {
                        // returned false
                        group.leave()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() ) {
                        
                        selectedUser = workerData.selectedWorker
                        self.navigate.nextView(nextView: "SelectCleanerView")
                    }
                }
           // }
           
           
        } else {
          
                iconItem.forEach{ icon in
                    if icon.isSelected == true{
                        self.typeArray.append(icon.type)
                    }}
                
                iconItem2.forEach{ icon2 in
                    if icon2.isSelected == true{
                        self.typeArray.append(icon2.type)
                    }}

            
//            let country  = "USA"
//            let city  = "SF"
//            let address =  street + "SF" + aptunit + zipcode
            //serviceData.prepareServiceData(name: fullname, phone: phone, address: address, country: country, city: city, street: street, apt: aptunit, zipcode: zipcode, type: typeArray , start: start, totalhours: totalhours, workerName: workerData.selectedWorker.name)

            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            
                
                print(workerData.workers)
                //workerlist = workerData.workers

                //self.navigate.nextView(nextView: "SelectCleanerView")
        
               goToNextView = 1
            }
        }
        
    }
    
    var body: some View {

        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Spacer()
                        Button(action: { startSearch()  }){
 
                                                Text("SEARCH")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                         Spacer()
                    }.background(Theme.init().darkGreen)
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
        if isSearching {
            
            Image("sparkle").onAppear(){
               
                                let group = DispatchGroup()
                                group.enter()
                let country  = "USA"
                let city  = "SF"
                let address =  street + "SF" + aptunit + zipcode
                let id = UUID()
                let endDate: Date = Date()
                let service  = Service(id: id.description , name: fullname, phone: phone, address: address, country: country, city: city, street: street , apt: aptunit, zipcode: zipcode, type: typeArray, startdate: start, enddate: endDate, workerName: workerData.selectedWorker.name)
                //serviceData.prepareServiceData(name: fullname, phone: phone, address: address, country: country, city: city, street: street, apt: aptunit, zipcode: zipcode, type: typeArray , start: start, totalhours: totalhours, workerName: workerData.selectedWorker.name)
                serviceData.thisService = service
                                workerData.loadWorkers(){ isSucceeded in
                                    if isSucceeded {
                                        group.leave()
                                    } else {
                                        // returned false
                                        group.leave()
                                    }
                                }
            }

            Text("Please Wait... ")
            Text("We are searching house keeper for you ")
            
            NavigationLink(
                destination:
                    
                    //SelectCleanerView( navigate: navigate, selectedUser: $selectedUser,workerlist: workerlist, fullname: $fullname, phone: $phone, street: $street, aptunit: $aptunit, zipcode: $zipcode, totalhours: $totalhours,  iconItem: iconItem, iconItem2: iconItem2),
                    SelectCleanerView(navigate: navigate, selectedUser: $selectedUser, workerlist: workerlist),
                tag: 1,
                selection: $goToNextView){
                Text("")}
        }
        
        if !isSearching {
            VStack {
                
                Text("Is there any additional information you want to tell?")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(EdgeInsets(top:8, leading: 16,
                                         bottom:60, trailing:0 ))
                
                Group {
                    HStack{
                        Text("").bold()
                        Spacer()
                    }
                
                    VStack {
                        TextEditor( text: $additioalInformation)
                             .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Theme.init().darkGreen, lineWidth: 2)
                                        )
                        
                        HStack {
                            Image(systemName: selectedNone ? "largecircle.fill.circle" : "circle").onTapGesture {
                                selectedNone.toggle()
                                if selectedNone{
                                    additioalInformation = ""
                                }
                            }
                            Text("NONE").bold()
                            Spacer()
                        }.frame(width: 300)
                    }.padding()
                        //.shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                        
                   
                   
                }
              
               
                Spacer()

            }.foregroundColor(Theme.init().darkGreen)
        }
 
    }
}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
