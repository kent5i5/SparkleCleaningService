//
//  Service.swift
//  Sparkle
//
//  Created by ying kit ng on 3/22/21.
//

import Foundation

struct Service{
    var name: String
    
    /// Initializes a new `Profile` with a specified name.
    ///  - Parameters:
    ///     - name Name of the user profile.
    init(nameArg name: String) {
      self.name = name
    }
}


final class ServiceObervableObject   {
    @Published var name: String
    
   // var service = Service(nameArg: self.name)

    init() {
        self.name = ""

    }
}
extension ServiceObervableObject: ObservableObject {
       
}
