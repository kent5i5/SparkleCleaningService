//
//  newCustomerConfirmView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct newCustomerConfirmView: View {
    @ObservedObject var navigate: serviceNavigator
    var body: some View {
        Text("Hello, new Customer!")
        
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                       
                        Spacer()
                        Button(action: {navigate.nextView(nextView: "showPaymentView")}){
                                                //Image("chevron-top")
                                                Text("CONFIRM")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                       
                    }.background(Theme.init().darkGreen)
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
    }
}

//struct newCustomerConfirmView_Previews: PreviewProvider {
//    static var previews: some View {
//        newCustomerConfirmView()
//    }
//}
