//
//  ServiceNavigator.swift
//  Sparkle
//
//  Created by ying kit ng on 4/18/21.
//

import Foundation


class serviceNavigator {
    @Published var currentView: String
    @Published var preView: String
    @Published var firstView: String
    
    init(currentView: String, preView: String,  firstView: String){
        self.currentView = currentView
        self.firstView = firstView
        self.preView = preView
    }
    func previousView(){
        self.currentView = self.preView

    }
//    func previousView(previousView: String){
//        self.currentView =  previousView
//
//    }
    
    func nextView(nextView: String){
        self.preView = currentView
        self.currentView = nextView
 
    }
    
    func resetView(){
        self.currentView = self.firstView

    }
    
}
