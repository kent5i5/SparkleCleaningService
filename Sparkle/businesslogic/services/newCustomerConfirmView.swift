//
//  newCustomerConfirmView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct newCustomerConfirmView: View {
    @EnvironmentObject var modelData: User
    @EnvironmentObject var workerData: WorkerRepository
    @ObservedObject var navigate: serviceNavigator
    @ObservedObject var workerlist: WorkerRepository
    
    @Binding var fullname: String
    @Binding var phone: String
    
    
    @Binding var street: String
    @Binding var aptunit: String
    @Binding var zipcode: String

    @Binding var totalhours: Int
    @Binding var start: Date
    
    @Binding var iconItem: [Icon]
    @Binding var iconItem2: [Icon]
    
    @Binding var selectedUser: Worker
    @State var typeArray: [String] = []
    
    
    @State var workers: [Worker] = []
    
    init(navigate: serviceNavigator, workerlist: WorkerRepository, fullname: Binding<String>, phone: Binding<String>, street: Binding<String>, aptunit: Binding<String>,
         zipcode: Binding<String>, totalhours: Binding<Int>, start: Binding<Date>, iconItem: Binding<[Icon]>, iconItem2: Binding<[Icon]> , selectedUser: Binding<Worker>){
        self.navigate = navigate
        self._fullname = fullname
        self._phone = phone
        self._street = street
        self._aptunit = aptunit
        self._zipcode = zipcode
        self._totalhours = totalhours
        self._start = start
        self._iconItem = iconItem
        self._iconItem2 = iconItem2
        self._selectedUser = selectedUser
        self.workerlist = workerlist
        
    }
    

    
    static let taskDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "E, dd/MM/yyyy | HH:mm z"
            formatter.dateStyle = .long
            return formatter
        }()
    
    func loadWorker(){
        DispatchQueue.main.async() {
            self.workerlist.loadWorkers()
            print(self.workerlist.workers)
            
            workers = self.workerlist.getWorkerList()
        }
    }
    
    func resetView(){
        
        iconItem.forEach{ icon in
            if icon.isSelected == true {}
        }
        fullname =  ""
        phone = ""
        street = ""
        aptunit = ""
        zipcode = ""
        start = Date()
        print(street + aptunit + zipcode)
        
    }
    var body: some View {
        Text("").onAppear(){// Fill the type array with the selected
            iconItem.forEach{ icon in
                if icon.isSelected == true{
                    self.typeArray.append(icon.name)
                }
            }
            
                iconItem2.forEach{ icon in
                    if icon.isSelected == true{
                        self.typeArray.append(icon.name)
                    }
                }
                
        }
        
        VStack {
            Text("Your cleaner has been selected")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                .padding(EdgeInsets(top:8, leading: 16, bottom:30, trailing: 16))
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
    
            
            CircleImageView(iconName: "cleaner-a")
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .shadow(radius: 12)
                .overlay(Circle().stroke(Theme.init().darkGreen, lineWidth: 10))
                .padding()
            
            Text("Ms. Maria W.").font(.title2).padding(3)
            
            Text("Thank for using our service," + fullname )
            
            Text("We contact you with this number: " )
            Text(  phone).padding(EdgeInsets(top:0, leading: 16, bottom:8, trailing: 16))
            
            Group {
                
                Text(" Date | Time ").scaleEffect(0.8)
                Text("\(start, formatter: Self.taskDateFormat)" ).font(.caption)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    .padding(EdgeInsets(top:0, leading: 16, bottom:8, trailing: 16))

                Group {
                    Text( "Address").font(.caption).scaleEffect(0.8)
                    Text(street).font(.caption).bold()
                    Text(aptunit).font(.caption).bold()
                    Text( "San Francisco").font(.caption).bold()
                    Text( zipcode).font(.caption).bold()
                    
                    Divider().frame(width: 300, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Theme.init().lightGreen)
                }
                
             
                LazyVStack{
                    
                    List(workerlist.workers) { worker in // (2)
                            VStack(alignment: .leading) {
                                Text("\(worker.price)").font(.headline)
                              Text("\(worker.limit)").font(.subheadline)
                              Text("\(worker.type)").font(.subheadline)
                                
                            
                            }
                    }
                    
                    ForEach(workerData.workers){ worker in
                        
                        Text("price:" + "\(worker.price)")
                    }
                    Text( "\(selectedUser.price)").font(.caption).scaleEffect(1.5)
                    Text( "LIMIT: 4 hours " + " One Time" )
                    Text( "House Cleaning Services")
                    Divider().frame(width: 300, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Theme.init().lightGreen)
                }
                
            }
            
            Text("EDIT").onTapGesture {
                resetView()
            }.sparklefilledlightbutton()
            
        }.foregroundColor(Theme.init().darkGreen)
      
        
        
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                       
                        Spacer()
                        Button(action: {navigate.nextView(nextView: "showPaymentView")}){
                                                //Image("chevron-top")
                                                Text("CONFIRM")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                       
                    }.background(Theme.init().darkGreen)
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
    }
}

//struct newCustomerConfirmView_Previews: PreviewProvider {
//    static var previews: some View {
//        newCustomerConfirmView()
//    }
//}
