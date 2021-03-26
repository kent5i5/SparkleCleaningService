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
    @Published var addresss: String
    @Published var country: String
    @Published var city: String
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
    internal init(uid: String, name: String, password: String, addresss: String, country: String, city: String){
        self.uid = uid
        self.name = name
        self.password = password
        self.addresss = addresss
        self.country = country
        self.city = city
    }
    
    
    init() {
        self.uid = ""
        self.name = ""
        self.password = ""
        self.addresss = ""
        self.country = ""
        self.city = ""
    }
    
    
    func setName(name: String){
        self.name = name
    }

}

extension User: ObservableObject {
   
}
