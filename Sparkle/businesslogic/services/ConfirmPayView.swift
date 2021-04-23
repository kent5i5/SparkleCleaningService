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
        
            var path = serviceData.newService(name: "user name", phone: phone ,  address: "", country: "", city: "", street: street, apt: aptunit, zipcode: zipcode, type: typeArray , workerName: "")
            let fbhandler = Fbhandler(modelData: modelData)
            fbhandler.storeService(sid: path )
        
        } else {
            serviceData.createService(name: fullname,  phone: phone, address: "", country: "", city: "", street: street, apt: "apt", zipcode: zipcode, type: typeArray, start: start, totalhours: totalhours, workerName:  "")
            //resetView()
        }
    }
    
    
    var body: some View {
        Text("Confirm").onTapGesture {
            
            
            navigate.nextView(nextView: "SelectServiceSubView")
            
            Text("create order")
        }
    }
}

//struct ConfirmPayView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmPayView()
//    }
//}
