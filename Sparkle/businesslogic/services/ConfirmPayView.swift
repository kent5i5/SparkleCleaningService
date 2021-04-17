//
//  ConfirmPayView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct ConfirmPayView: View {
    @ObservedObject var navigate: serviceNavigator
    
    var body: some View {
        Text("Confirm").onTapGesture {
            navigate.nextView(nextView: "SelectServiceSubView")
        }
    }
}

//struct ConfirmPayView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmPayView()
//    }
//}
