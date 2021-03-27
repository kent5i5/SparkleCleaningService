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
    @State var iconItem: [Icon] = [ Icon(name: "arrow.clockwise.icloud.fill",type: "type1", isSelected: true),
                                    Icon(name: "arrow.clockwise.icloud", type: "type2", isSelected:false),
                                    Icon(name: "checkmark.icloud.fill",type: "type3",  isSelected:false),
                                   Icon(name: "icloud.and.arrow.down.fill",type: "type4", isSelected:false),
                                       Icon(name: "link.icloud.fil",type: "type5",  isSelected:false),
                                       Icon(name: "key.icloud.fill",type: "typey6",  isSelected:false),
                                   Icon(name: "icloud.and.arrow.down.fill",type: "type7", isSelected:false),
                                       Icon(name: "arrow.clockwise.icloud",type: "type8", isSelected:false),
                                       Icon(name: "checkmark.icloud.fill",type: "type9",  isSelected:false)]
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
                    ArrivalTimeFormUIView(currentStep: $showSelectService, wakeUp: $wakeUp)
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
                                                Image(systemName: "arrow.up.circle")
                                                    .foregroundColor(.green)
                                                Text("DONE")
                                                    .foregroundColor(.green)
                                            }
                                        })
//                                        }, trailing:)
                    
                }
                
                if(showSelectService < 4){
                     Button(action: {changeView()}){
                         Text("NEXT")
                     }.frame(maxWidth: .infinity, maxHeight: .infinity)
                     .border(Color.green)
                     .foregroundColor(.green)
                     .clipped()
                     .padding(10)
                     .navigationBarTitle("", displayMode: .inline)
                     .navigationBarItems(leading:
                                 Button(action: {
                                     self.presentationMode.wrappedValue.dismiss()
                                 }) {
                                     HStack {
                                         Image(systemName: "arrow.left.circle")
                                         Text("Go Back")
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
        currentStep = 1

    }
    
    init(currentStep: Binding<Int>, iconItem: Binding<[Icon]>){
        self._currentStep = currentStep
        self._iconItem = iconItem
    }
    
    var body: some View {
        VStack {
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
                .frame(height: 40, alignment: .center)
                .cornerRadius(10)
                .border(Color.green)
                .padding(10)
            
            TextField("Apt/Unit: ", text: $aptunit)
                .frame(height: 40, alignment: .center)
                .cornerRadius(10)
                .border(Color.green)
                .padding(10)
            TextField("Zip Code: ", text: $zipcode)
                .frame(height: 40, alignment: .center)
                .cornerRadius(10)
                .border(Color.green)
                .padding(10)
            
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

    func addService(){
        if !modelData.uid.isEmpty {
            //let serviceHandler = ServiceRepository()
            var typeArray: [String] = []
            iconItem.forEach{ icon in
                if icon.isSelected == true{
                    typeArray.append(icon.type)
                }
          
                
            }
            var path = serviceData.newService(name: "service any", date: Date() , address: "", country: "", city: "", street: street, apt: aptunit, zipcode: zipcode, type: typeArray)
            let fbhandler = Fbhandler(modelData: modelData)
            fbhandler.storeService(sid: path )
        
        }
      
    }
    func resetView(){
        print(street + aptunit + zipcode)
        currentStep = 1

    }
    var body: some View {

            VStack {
                Button(action: {addService()}){
                    Text("finish and add")
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(Color.green)
                .foregroundColor(.green)
                .clipped()
                .padding(10)
                Button(action: {resetView()}){
                    Text("reset")
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(Color.green)
                .foregroundColor(.green)
                .clipped()
                .padding(10)
            }
        }


}
