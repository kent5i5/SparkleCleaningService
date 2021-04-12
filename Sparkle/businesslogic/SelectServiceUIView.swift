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

struct SelectServiceUIView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @State var showSelectService = 1
    @State private var wakeUp = Date()
    
    //@State var services = ServiceRepository()
    @State var iconItem: [Icon] = [ Icon(name: "arrow.clockwise.icloud.fill",type: "clean room", isSelected: true),
                                    Icon(name: "arrow.clockwise.icloud", type: "child care", isSelected:false),
                                    Icon(name: "checkmark.icloud.fill",type: "cooking",  isSelected:false),
                                   Icon(name: "icloud.and.arrow.down.fill",type: "teaching", isSelected:false),
                                       Icon(name: "link.icloud.fill",type: "watch",  isSelected:false),
                                       Icon(name: "key.icloud.fill",type: "singing",  isSelected:false),
                                   Icon(name: "icloud.and.arrow.down.fill",type: "talk", isSelected:false),
                                       Icon(name: "arrow.clockwise.icloud",type: "shopping", isSelected:false),
                                       Icon(name: "checkmark.icloud.fill",type: "reading",  isSelected:false)]
    @State var street: String = ""
    @State var aptunit: String = ""
    @State var zipcode: String = ""
    
    func changeView(){
        showSelectService = showSelectService + 1

    }
    
    func resetView(){
        showSelectService = 1
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                if (showSelectService == 1){
                    SelectServiceSubView(currentStep: $showSelectService, iconItem: $iconItem)
                }
                if (showSelectService == 2){
                    ArrivalTimeFormUIView(currentStep: $showSelectService)
                        .environmentObject(serviceData)
                }
                
                if (showSelectService == 3){
                    LocationFormUIView(currentStep: $showSelectService, street: $street, aptunit: $aptunit, zipcode: $zipcode)
                        .environmentObject(modelData)
                }
                if (showSelectService == 4){
                    GoHomeButton(currentStep: $showSelectService, iconItem: $iconItem,  street: $street, aptunit: $aptunit, zipcode: $zipcode)
                        .environmentObject(modelData)
                        .environmentObject(serviceData)
                                    .navigationBarItems(leading:
                                        Button(action: {
                                            self.presentationMode.wrappedValue.dismiss()
                                        }) {
                                            HStack {
                                                //Image(systemName: "arrow.up.circle")
                                                Image(systemName: "trash")
                                                    .foregroundColor(.green)
                                                //Text("CANCEL").foregroundColor(.green)
                                            }
                                        })
//                                        }, trailing:)
                    
                }
                
                if(showSelectService < 4){
                     Button(action: {changeView()}){
                        //Image("chevron-top")
                        Text("NEXT")
                            .foregroundColor(.white)
                                .padding()
                                .background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                                .cornerRadius(8)
                     }//.frame(maxWidth: .infinity, maxHeight: .infinity)
                     .foregroundColor(.green)
                     .navigationBarTitle("", displayMode: .inline)
                     .navigationBarItems(leading:
                                 Button(action: {
                                     self.presentationMode.wrappedValue.dismiss()
                                 }) {
                                     HStack {
                                         Image(systemName: "trash").foregroundColor(.green)
//                                         Text("CANCEL").foregroundColor(.green)
//                                            .cornerRadius(8)
//                                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                     }
                             })
                }
            }
        }.navigationBarHidden(true)
        
    }
}

struct SelectServiceUIView_Previews: PreviewProvider {
    static var previews: some View {
        SelectServiceUIView()
    }
}

struct SelectServiceSubView: View {
    @Binding var currentStep: Int
    @Binding var iconItem: [Icon]
  
    
    func resetView(){
        for i in 0..<iconItem.count {
            
            iconItem[i].isSelected = false
        }

    }
    
    init(currentStep: Binding<Int>, iconItem: Binding<[Icon]>){
        self._currentStep = currentStep
        self._iconItem = iconItem
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Which room do you want to be cleaned")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 300, height: 100, alignment: .leading)
                .foregroundColor(.green)
                .padding(0.0)
            
            Button(action: {resetView()}){
                Text("clear all")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(.green)
            }
            
            
            HStack {
                ForEach(0..<3) { index in
                        
                    CheckView(iconItem: $iconItem, numItem: index)

                }
            }
            HStack {
                ForEach(3..<6) { index in
                    
                    CheckView(iconItem: $iconItem , numItem: index)

                }
            }
            HStack {
                ForEach(6..<9) {  index in

                    CheckView(iconItem: $iconItem, numItem: index )

                }
            }
            
    
        }.frame(alignment: .leading).ignoresSafeArea()
    }
}

struct LocationFormUIView: View {
    
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @Binding var currentStep: Int
    @Binding var street: String
    @Binding var aptunit: String
    @Binding var zipcode: String
    
    func resetView(){
        currentStep = 1

    }
    
//    init(currentStep: Binding<Int>){
//        self._currentStep = currentStep
//    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Where do you want cleaner go")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.green)
            
            Button(action: {resetView()}){
                Text("clear all")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(.green)
            }
            
            TextField("Street: ", text: $street)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
               
                .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
            
            TextField("Apt/Unit: ", text: $aptunit)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
               
                .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
            TextField("Zip Code: ", text: $zipcode)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:8, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green))
               
                .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
            
        }
    }
}

struct GoHomeButton: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @Binding var currentStep: Int
    @Binding var iconItem: [Icon]
    @Binding var street: String
    @Binding var aptunit: String
    @Binding var zipcode: String

    @State var typeArray: [String] = []
    func addService(){
        if !modelData.uid.isEmpty {
            //let serviceHandler = ServiceRepository()
           // var typeArray: [String] = []
        
            var path = serviceData.newService(name: "service",  address: "", country: "", city: "", street: street, apt: aptunit, zipcode: zipcode, type: typeArray )
            let fbhandler = Fbhandler(modelData: modelData)
            fbhandler.storeService(sid: path )
        
        } else {
            serviceData.createService(name: "service", address: "", country: "", city: "", street: street, apt: "apt", zipcode: zipcode, type: typeArray)
            resetView()
        }
      
    }
    func resetView(){
        print(street + aptunit + zipcode)
        currentStep = 1
        iconItem.forEach{ icon in
            if icon.isSelected == true {}
        }
        street = ""
        aptunit = ""
        zipcode = ""
        serviceData.startDate = Date()
        serviceData.endDate = Date()
    }
    var body: some View {

            VStack {
                Spacer()
                Text("Service").onAppear(){// Fill the type array with the selected
                    iconItem.forEach{ icon in
                        if icon.isSelected == true{
                            self.typeArray.append(icon.type)
                        }
                } }
                
                Divider()
               // Text("Types:")
               
                VStack {
                    HStack {
                        Text(" - Street ").font(.caption)
                        Text(street).font(.caption)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(" - Apt/Unit " + aptunit).font(.caption)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(" - Zip Code " + zipcode).font(.caption)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(" - Start Date \(serviceData.startDate) " ).font(.caption)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(" - Start Date \( serviceData.endDate)").font(.caption)
                        Spacer()
                    }
                    Divider()
                    
                }
               
                Button(action: {addService()}){
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(2)
                        .clipShape(Circle())
                    Text(" Add the Services").font(.caption)
                        .cornerRadius(8)
        
                }.padding(EdgeInsets(top:8, leading: 16,
                                     bottom:8, trailing:16 )).cornerRadius(8)
                //.border(Color.green.opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.green))
                .foregroundColor(.green)
  
          
                
                Button(action: {resetView()}){
                    Text("reset").foregroundColor(.white)
                        .padding()
                        .background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                        .cornerRadius(8)
                }.padding()
                .foregroundColor(.green)
//                .clipped()
//                .padding(10)
            }
        }


}
