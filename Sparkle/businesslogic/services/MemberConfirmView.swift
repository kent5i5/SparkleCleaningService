//
//  GoHomeButton.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct MemberConfirmView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @ObservedObject var navigate: serviceNavigator
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
    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    func resetView(){
        
        currentStep = 1
        iconItem.forEach{ icon in
            if icon.isSelected == true {}
        }
        street = ""
        aptunit = ""
        zipcode = ""
        serviceData.startDate = Date()
        print(street + aptunit + zipcode)
        serviceData.endDate = Date()
    }
    var body: some View {
        
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Button(action: {previousView()}){
                            Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                        }.offset(x: 20, y: 0)
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

            VStack {
                Text("").onAppear(){// Fill the type array with the selected
                    iconItem.forEach{ icon in
                        if icon.isSelected == true{
                            self.typeArray.append(icon.type)
                        }
                } }
                
                CircleImageView(iconName: "cleaner-a")
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .shadow(radius: 12)
                    .overlay(Circle().stroke(Theme.init().darkGreen, lineWidth: 10))
                    .padding()
                
                
                    HStack{
                        Text("").bold()
                        Spacer()
                    }
                Button(action: { resetView()}){
                    Text("reset" )
                }
                    Text("Ms. Maria W.").font(.title2).padding(3)
                

               
                Group {
                    HStack {
                        Text(" - Street ").font(.caption)
                        Text(street).font(.caption)
                        Spacer()
                    }
                    Text(" Date | Time ")
                    Text(" - Start Date \(serviceData.startDate) " ).font(.caption)
//                        HStack {
//
//                            Spacer()
//                        }
                    Group {
                        Text( "Address").font(.caption).scaleEffect(0.5)
                        Text(aptunit).font(.caption)
                        Text( "San Francisco").font(.caption)
                        Text( zipcode).font(.caption)
                    }
                    
                    Divider()
                    Group {
                        Text( "Address").font(.caption).scaleEffect(1.5)
                        Text( "1.5 Bedrooms x2 " + " 1 Living Room" )
                        Text( "1 Kitchen " + " 1 Bath Room" + "1 Laundary")
                    }
                    
                }
                Divider()
                
                Text("CONFIRM").font(.custom("Times New Roman", size: 25))
                    .font(.custom("Times New Roman", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
                    .background(Theme.init().lightGreen)
                    .cornerRadius(25)
                    .foregroundColor(.white)
                    .onTapGesture {
                        addService()
                    }
//                Button(action: {addService()}){
//                    Image(systemName: "plus")
//                        .resizable()
//                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .cornerRadius(2)
//                        .clipShape(Circle())
//                    Text(" Add the Services").font(.caption)
//                        .cornerRadius(8)
//
//                }.padding(EdgeInsets(top:8, leading: 16,
//                                     bottom:8, trailing:16 )).cornerRadius(8)
//                //.border(Color.green.opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
//                .overlay(RoundedRectangle(cornerRadius: 30)
//                            .stroke(lineWidth: 1)
//                            .foregroundColor(.green))
//                .foregroundColor(.green)
                
              
                
            }.foregroundColor(Theme.init().darkGreen)
        }


}


//struct GoHomeButton_Previews: PreviewProvider {
//    static var previews: some View {
//        GoHomeButton()
//    }
//}
