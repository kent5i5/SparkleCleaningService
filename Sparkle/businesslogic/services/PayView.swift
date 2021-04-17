//
//  PayView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct PayView: View {
    @ObservedObject var navigate: serviceNavigator
    
    var body: some View {
        Button(action: {   navigate.nextView(nextView: "ConfirmPayView")}){
            Text("Pay ")
        }
      
          
        
        
        
    }
}

//struct PayView_Previews: PreviewProvider {
//    static var previews: some View {
//        PayView()
//    }
//}
