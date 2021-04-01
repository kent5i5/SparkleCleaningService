//
//  PaymentView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI

struct PaymentView: View {
    var paymentMethods = ["Paypal", "Apple Pay", "Google Pay", "VISA"]
    @State private var selectedPaymentIndex = 0
    
    var body: some View {
        VStack {
            Picker(selection: $selectedPaymentIndex, label: Text("")) {
                        ForEach(0 ..< paymentMethods.count) {
                           Text(self.paymentMethods[$0])
                        }
            }
            Text("Your favorite payment method: \(paymentMethods[selectedPaymentIndex])")
           Spacer()
        }.custombackbtn()
                
       
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
