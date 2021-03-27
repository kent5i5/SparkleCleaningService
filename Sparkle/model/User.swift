//
//  User.swift
//  Sparkle
//
//  Created by ying kit ng on 3/10/21.
//

import Combine
import Firebase

struct Profile{
    var name: String
    var password: String
    init() {
        self.name = ""
        self.password = ""
    }
    
    /// Initializes a new `Profile` with a specified name.
    ///  - Parameters:
    ///     - name Name of the user profile.
    init(nameArg name: String, passwordArg password: String) {
      self.name = name
      self.password = password
    }
}

final internal class User  {
    @Published var uid: String
    
    @Published var isRegistered: Bool  = false
    @Published var name: String
    @Published var password: String
    @Published var address: String
    @Published var country: String
    @Published var city: String
    
    @Published var services:[Service]
    //let willChange  = PassthroughSubject<User, Never>()
    
//    var profile: Profile = Profile(){
//        willSet {
//            willChange.send(self)
//        }
//    }
    
    /// Initializes a new `User` with a specified name.
    ///  - Parameters:
    ///     - name Name of the user 
    ///     - password password  of the user
    internal init(uid: String, name: String, password: String, address: String, country: String, city: String, date: Date){
        self.uid = uid
        self.name = name
        self.password = password
        self.address = address
        self.country = country
        self.city = city
        services = []
    }
    
    
    init() {
        self.uid = ""
        self.name = ""
        self.password = ""
        self.address = ""
        self.country = ""
        self.city = ""
        
        services = []
    }
    
    
    func setName(name: String){
        self.name = name
    }
    
    func addService(type: String){
        let sid = UUID()
        let id = "services/" + sid.description
        let date = Date()
        //services.append(Service(id: id, name: self.name, date: date, address: address, country: country, city: city, type: type))
    }

}

extension User: ObservableObject {
   
}
