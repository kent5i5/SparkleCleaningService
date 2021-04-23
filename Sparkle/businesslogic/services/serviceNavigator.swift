//
//  ServiceNavigator.swift
//  Sparkle
//
//  Created by ying kit ng on 4/18/21.
//

import Foundation


class serviceNavigator {
    @Published var currentView: String
    @Published var viewlist: [String]
    
    init(currentView: String,   firstView: String){
        self.currentView = currentView
        
        self.viewlist = []
        self.viewlist.append(firstView)
    }
    func previousView(){
        
        if !self.viewlist.isEmpty  {
            return self.currentView = self.viewlist.popLast()!
        }

    }

    
    func nextView(nextView: String){
        self.viewlist.append(currentView) 
        self.currentView = nextView
 
    }
    
    func resetView(){
        self.currentView = self.viewlist[0]

    }
    
}

extension serviceNavigator: ObservableObject {
    
}
