//
//  Service.swift
//  Sparkle
//
//  Created by ying kit ng on 3/22/21.
//
import SwiftUI

struct Service: Identifiable {
    //let id = UUID()
    let id: String 
    let name: String
    let date: Date
    let address: String
    let country: String
    let city: String

}

//
//final class ServiceObervableObject  {
//    @Published var serivces: Service = []
//    
//   // var service = Service(nameArg: self.name)
//
//    func newService(name: String , data: Date, address: String, country: String, city: String) -> Service{
////        var newService  = Service()
////        return newService
//    }
//    func remove(at index: Int){
//        
//    }
//}
//extension ServiceObervableObject: ObservableObject {
//       
//}
