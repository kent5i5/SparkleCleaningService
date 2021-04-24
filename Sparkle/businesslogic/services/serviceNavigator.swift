//
//  ServiceNavigator.swift
//  Sparkle
//  Navigation Object,  takes two value , control the flow the service views
//      currentView - the current subview
//      firstView - the first subview
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
    
    
    /// Navigate back to preview subview based on naem in the viewlist and remove it from viewlist never remove firstview
    func previousView(){
        
        if !self.viewlist.isEmpty  {
            return self.currentView = self.viewlist.popLast()!
        }

    }

    
    /// Navigate to next view with the give name
    /// parameter
    ///     - nextView a string that represent the next view
    func nextView(nextView: String){
        self.viewlist.append(currentView) 
        self.currentView = nextView
 
    }
    
    /// Navigate to first view
    func resetView(){
        self.currentView = self.viewlist[0]

    }
    
}

extension serviceNavigator: ObservableObject {
    
}
