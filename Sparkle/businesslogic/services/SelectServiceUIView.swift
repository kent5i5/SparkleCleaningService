//
//  SelectServiceUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI
import Firebase


struct Icon: Identifiable {
  let id = UUID()
  let name: String
    let type: String
    var isSelected: Bool

}

struct SelectServiceUIView: View , Equatable {
    
    static func == (lhs: SelectServiceUIView, rhs: SelectServiceUIView) -> Bool {
        // << return yes on view properties which identifies that the
        // view is equal and should not be refreshed (ie. `body` is not rebuilt)
        return true
    }
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @EnvironmentObject var workerData: WorkerRepository
    @State var showSelectService = 1
    @State private var wakeUp = Date()
    
    @State private var additionalNote: String = ""
    
    //@State var services = ServiceRepository()
    @State var iconItem: [Icon] = [ Icon(name: "backyard",type: "backyard", isSelected: false),
                                    Icon(name: "dinningroom", type: "dinningroom", isSelected:false),
                                    Icon(name: "guestroom",type: "guestroom",  isSelected:false),
                                   Icon(name: "kidroom",type: "kidroom", isSelected:false),
                                       Icon(name: "livingroom",type: "livingroom",  isSelected:false),
                                       Icon(name: "dinningroom",type: "diningroom",  isSelected:false),
                                   Icon(name: "guestroom",type: "guestroom", isSelected:false),
                                       Icon(name: "guestroom",type: "guestroom", isSelected:false),
                                       Icon(name: "additional-work",type: "addition",  isSelected:false)]
    
    @State var iconItem2: [Icon] = [ Icon(name: "clothing",type: "clothing", isSelected: false),
                                    Icon(name: "cooking", type: "cooking", isSelected:false),
                                    Icon(name: "flooring",type: "flooring",  isSelected:false),
                                   Icon(name: "refrigerator",type: "refrigerator", isSelected:false),
                                       Icon(name: "storage",type: "storage",  isSelected:false),
                                       Icon(name: "washingmachine",type: "wash-machine",  isSelected:false),
                                   Icon(name: "water plant",type: "water plant", isSelected:false),
                                       Icon(name: "waxing",type: "waxing", isSelected:false),
                                       Icon(name: "additional-work-lightgreen",type: "additional",  isSelected:false)]
    @State var fullname: String = ""
    @State var phone: String = ""

    @State var street: String = ""
    @State var aptunit: String = ""
    @State var zipcode: String = ""
    
    @State var totalhours: Int = 1
    @State var start = Date()
    
    @State var selectedUser = Worker(name: "", price: 0, picture: "", limit: 0, type: "", intro: "", isSelected: false)
    @State var workers:[Worker] = []
    @ObservedObject var navigate: serviceNavigator
    @ObservedObject var workerlist: WorkerRepository 
    
    func changeView(){
        showSelectService = showSelectService + 1

    }
    
    func resetView(){
        showSelectService = 1
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                switch navigate.currentView {
                case "HowToContactView" : HowToContactView(navigate: navigate,  fullname: $fullname , phone: $phone)
                case "SelectServiceSubView" :  SelectServiceSubView(navigate: navigate, currentStep: $showSelectService, iconItem: $iconItem, totalhours: $totalhours)

                case "SelectServiceSubView2" : SelectServiceSubView2(navigate: navigate, currentStep: $showSelectService, iconItem: $iconItem2, totalhours: $totalhours)
                    //.animation(.easeIn(duration: 2.0)).transition(.scale(scale: 0.9))
                case "ArrivalTimeFormUIView" : ArrivalTimeFormUIView(navigate: navigate, start: $start, currentStep: $showSelectService)
                    .transition(.scale)
                case "LocationFormUIView" : LocationFormUIView(navigate: navigate, currentStep: $showSelectService, street: $street, aptunit: $aptunit, zipcode: $zipcode)
                    
                case "SearchView" : SearchView(navigate: navigate,workerlist: workerlist , selectedUser: $selectedUser,additioalInformation: $additionalNote, fullname: $fullname, phone: $phone, street: $street, aptunit: $aptunit, zipcode: $zipcode, totalhours: $totalhours, start: $start, iconItem: $iconItem, iconItem2: $iconItem2)
                    
                    
                //case "SelectCleanerView" :  SelectCleanerView(navigate: navigate, selectedUser: $selectedUser, workerlist: workerlist)
                    
                case "AcceptCleanerView" : AcceptCleanerView(navigate: navigate,currentStep: $showSelectService)
                case "MemberConfirmView" : MemberConfirmView(navigate: navigate)
                case "newCustomerConfirmView": newCustomerConfirmView(navigate: navigate, fullname: $fullname, phone: $phone, street: $street, aptunit: $aptunit, zipcode: $zipcode, totalhours: $totalhours, start: $start, iconItem: $iconItem, iconItem2: $iconItem2, selectedUser: $selectedUser)
                case "showPaymentView": PayView(navigate: navigate)
                case "ConfirmPayView": ConfirmPayView(navigate: navigate,fullname: $fullname, phone: $phone, street: $street, aptunit: $aptunit, zipcode: $zipcode, totalhours: $totalhours, start: $start, iconItem: $iconItem, iconItem2: $iconItem2)
                    default:
                        Text("done")


                }


                    Text("")
                    .navigationBarItems(leading:
                        Button(action: {
                            navigate.currentView = navigate.viewlist[0]
                            //navigate.viewlist  = []
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                //Image(systemName: "arrow.up.circle")
                               
                                Image(systemName: "trash")
                                    .foregroundColor(.green)
                                //Text("CANCEL").foregroundColor(.green)
                            }
                        })
                        .navigationBarTitle("", displayMode: .inline)
                
                
            }

        }.navigationBarHidden(true)
        
    }
}

//struct SelectServiceUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        @ObservedObject var navigate = serviceNavigator(currentView: "HowToContactView", firstView: "")
//        SelectServiceUIView(navigate:navigate)
//    }
//}

struct SelectServiceSubView: View {
    
    @ObservedObject var navigate: serviceNavigator
    @Binding var currentStep: Int
    @Binding var iconItem: [Icon]
    @Binding var totalhours: Int

    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    func resetView(){
        for i in 0..<iconItem.count {
            if iconItem[i].isSelected{
                totalhours = totalhours - 1
            }
            iconItem[i].isSelected = false
        }

    }
    
//    init(currentStep: Binding<Int>, iconItem: Binding<[Icon]>){
//        self._currentStep = currentStep
//        self._iconItem = iconItem
//    }
    
    var body: some View {
        
        ScrollView {
            ZStack {
                VStack {
                        
                        Text("Which room do you want to be cleaned")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame( height: 60, alignment: .leading)
                            .padding(EdgeInsets(top:0, leading: 16,
                                                bottom:16, trailing:0 ))
                       
                        Button(action: {resetView()}){
                            Text("clear all")
                                .font(.body)
                                .fontWeight(.light)
                                .frame(width: 300, alignment: .trailing)
                        }.padding()
                        
                        
                        HStack {
                            ForEach(0..<3) { index in
                                    
                                CheckView(iconItem: $iconItem,totalhours: $totalhours,  numItem: index)

                            }
                        }
                        HStack {
                            ForEach(3..<6) { index in
                                
                                CheckView(iconItem: $iconItem, totalhours: $totalhours, numItem: index)

                            }
                        }
                        HStack {
                            ForEach(6..<9) {  index in

                                CheckView(iconItem: $iconItem, totalhours: $totalhours, numItem: index )

                            }
                        }
                    Text("Total time: \(totalhours)").padding()
                        Spacer()
                    GeometryReader { geometry in
                        Text("").toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                HStack{
                    
                                    Spacer()
                                    Button(action: {navigate.nextView(nextView: "SelectServiceSubView2")}){
                                                            //Image("chevron-top")
                                                            Text("NEXT")
                                                                .foregroundColor(.white)
                                                                    .padding()
                                                                    .cornerRadius(8)
                                                         }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                    Button(action: {navigate.nextView(nextView: "SelectServiceSubView2")}){
                                        Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                                    }.offset(x: -20, y: 0)
                                } .background(Theme.init().darkGreen)
                                .frame(width: geometry.size.width, alignment: .top)
                            }
                        }

                    }
                }.frame(alignment: .leading)//.ignoresSafeArea()
                .foregroundColor(Theme.init().darkGreen)
                .simultaneousGesture(DragGesture()
                            .onChanged {
                                if ($0.startLocation.x - $0.location.x) > 100 {
                                    //self.swipeX = .left
                                    navigate.nextView(nextView: "SelectServiceSubView2")
                                } else if $0.startLocation.x == $0.location.x {
                                    //self.swipeX = .zero
                                } else {
                                    //navigate.previousView()
                                }
                            }) // simultaneousGesture
            }
        }//scrollView
      
    }
}

struct SelectServiceSubView2: View {
    
    @ObservedObject var navigate: serviceNavigator
    @Binding var currentStep: Int
    @Binding var iconItem: [Icon]
    @Binding var totalhours: Int
    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    func resetView(){
        for i in 0..<iconItem.count {
            if iconItem[i].isSelected{
                totalhours = totalhours - 1
            }
            iconItem[i].isSelected = false
        }

    }
    
//    init(currentStep: Binding<Int>, iconItem: Binding<[Icon]>){
//        self._currentStep = currentStep
//        self._iconItem = iconItem
//    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                    
                    Text("Which room do you want to be cleaned")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame( height: 60, alignment: .leading)
                        .padding(EdgeInsets(top:0, leading: 16,
                                            bottom:16, trailing:0 ))
                   
                    Button(action: {resetView()}){
                        Text("clear all")
                            .font(.body)
                            .fontWeight(.light)
                            .frame(width: 300, alignment: .trailing)
                    }.padding()
                    
                    
                    Group {
                        HStack {
                            ForEach(0..<3) { index in
                                    
                                CheckView(iconItem: $iconItem, totalhours: $totalhours , numItem: index)
                            }

                        }
                        
                        HStack {
                            ForEach(3..<6) { index in
                                
                                CheckView(iconItem: $iconItem, totalhours: $totalhours,  numItem: index)

                            }
                        }
                        HStack {
                            ForEach(6..<9) {  index in

                                CheckView(iconItem: $iconItem, totalhours: $totalhours, numItem: index )

                            }
                        }
                        
                        Text("Total time: \(totalhours)").padding()
                    }
                   
                    
                    Spacer()
             GeometryReader { geometry in
                    Text("").toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            HStack{
                                Button(action: {navigate.previousView()}){
                                    Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                                }.offset(x: 20, y: 0)
                                Spacer()
                                Button(action: {navigate.nextView(nextView: "ArrivalTimeFormUIView")}){
                                                       
                                                        Text("NEXT")
                                                            .foregroundColor(.white)
                                                                .padding()
                                                                .cornerRadius(8)
                                                     }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                Button(action: {navigate.nextView(nextView: "ArrivalTimeFormUIView")}){
                                    Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                                }.offset(x: -20, y: 0)
                            } .background(Theme.init().darkGreen)
                            .frame(width: geometry.size.width, alignment: .top)
                        }
                    }
                    
                    
                    Spacer()
                }
            }.foregroundColor(Theme.init().darkGreen)
            .padding(.bottom)
            .simultaneousGesture(DragGesture()
                        .onChanged {
                            if $0.startLocation.x > $0.location.x {
                                //self.swipeX = .left
                                navigate.nextView(nextView: "ArrivalTimeFormUIView")
                            } else if $0.startLocation.x == $0.location.x {
                                //self.swipeX = .zero
                            } else {
                                navigate.previousView()
                            }
                        }) // simultaneousGesture
        }
      
    }
}




