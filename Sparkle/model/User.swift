//
//  User.swift
//  Sparkle
//
//  Created by ying kit ng on 3/10/21.
//

import Combine

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
    @Published var isRegistered: Bool  = false
    @Published var name: String
    @Published var password: String
    //let willChange  = PassthroughSubject<User, Never>()
    
//    var profile: Profile = Profile(){
//        willSet {
//            willChange.send(self)
//        }
//    }
    
    internal init(name: String, password: String){
//        self.profile.name = name
//        self.profile.password = password
        self.name =
    }
    
    init() {
//        self.profile.name = ""
//        self.profile.password = ""
    }
}

extension User: ObservableObject {
   
}
