//
//  ConfirmPayView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct ConfirmPayView: View {
    @EnvironmentObject var modelData: User
    @ObservedObject var navigate: serviceNavigator
    @EnvironmentObject var serviceData: ServiceRepository
    @EnvironmentObject var workerData: WorkerRepository
    
    @Binding var fullname: String
    @Binding var phone: String

    @Binding var street: String
    @Binding var aptunit: String
    @Binding var zipcode: String
    
    @Binding var totalhours: Int
    @Binding var start: Date
    
    @Binding var iconItem: [Icon]
    @Binding var iconItem2: [Icon]
    @State var typeArray: [String] = []
    
    func addService(){
        if !modelData.uid.isEmpty {
            //let serviceHandler = ServiceRepository()
           // var typeArray: [String] = []
        
            let path = self.serviceData.newService(name: "user name", phone: phone ,  address: "", country: "", city: "", street: street, apt: aptunit, zipcode: zipcode, type: typeArray , workerName: "")
            self.serviceData.storeService( uid: modelData.uid, sid: path )
        
        } else {
            serviceData.createService(name: fullname,  phone: phone, address: "", country: "", city: "", street: street, apt: "apt", zipcode: zipcode, type: typeArray, start: start, totalhours: totalhours, workerName:  "")
            //resetView()
        }
    }
    
    
    var body: some View {
        VStack {

            
            CircleImageView(iconName: workerData.selectedWorker.picture)
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .shadow(radius: 12)
                .overlay(Circle().stroke(Theme.init().darkGreen, lineWidth: 10))
                .padding()
            
            Text(workerData.selectedWorker.name).font(.title2).padding(3)
            

           
            Group {
                HStack {
                    Text("").font(.caption)
                   
                    Spacer()
                }
                Text(" Date | Time ")
                Text(" \(serviceData.thisService.startdate) " ).font(.caption)

                Group {
                    if !serviceData.thisService.street.isEmpty && !serviceData.thisService.city.isEmpty {
                        Text( "Address").font(.caption).scaleEffect(0.5)
                        Text(serviceData.thisService.street).font(.caption)
                        Text(serviceData.thisService.apt ).font(.caption)
                        Text( serviceData.thisService.city
                        ).font(.caption)
                        Text( serviceData.thisService.zipcode).font(.caption)
                    }
                }
                
                Divider()
                Group {
                    
                    if !serviceData.thisService.type.isEmpty {
                        
                   
                        Text( "Services").font(.caption).scaleEffect(1.5)
                       // Text( "1.5 Bedrooms x2 " + " 1 Living Room" )
                        //Text( "1 Kitchen " + " 1 Bath Room" + "1 Laundary")
                        Text("4 hours - One Time" )
                        HStack {
                            
                            ForEach(serviceData.thisService.type, id: \.self){ type in
                                Text(" "  + type)
                            }
                        }
                    } else {
                        Text("Please select a service")
                    }

                }
                Divider()
                VStack {
                    Text("Payment Information")
                    Text("Credit card: **** **** **** 1234")
                    Text("Total Charge 200").font(.headline)
                }.frame(width: 300, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).border(Theme.init().darkGreen, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
            }
            Divider()
            
            Text("Pay Now").font(.custom("Times New Roman", size: 25))
                .sparklefilledbutton()
                .onTapGesture {
                    //addService()
                    navigate.nextView(nextView: "SelectServiceSubView")
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
            
            Spacer()
            
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
        }.foregroundColor(Theme.init().darkGreen)
        
        
//        Text("Confirm").onTapGesture {
//
//            Text("create order")
//            navigate.nextView(nextView: "SelectServiceSubView")
//
//
//        }
    }
}

//struct ConfirmPayView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmPayView()
//    }
//}
