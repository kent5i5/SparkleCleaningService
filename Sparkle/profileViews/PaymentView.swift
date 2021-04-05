//
//  PaymentView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.managedObjectContext) var context
    var paymentMethods = ["Paypal", "Apple Pay", "Google Pay", "VISA"]
    @State private var selectedPaymentIndex = 0
    
    @FetchRequest(

      entity: Settings.entity(),

      sortDescriptors: [
        NSSortDescriptor(keyPath: \Settings.payment, ascending: true)
      ]

    ) var settings: FetchedResults<Settings>
    
    private func updatePaymentSetting(selected: Int){

        do {
           // self.context.delete(settings[0])
            settings[0].payment = self.paymentMethods[selected]
          try context.save()
        } catch {
          print("Error saving managed object context: \(error)")
        }
        
      
    }
    
    var body: some View {
        VStack {
            Picker(selection: $selectedPaymentIndex, label: Text("")) {
                        ForEach(0 ..< paymentMethods.count) {
                           Text(self.paymentMethods[$0])
                        }
            }
            Text("Your favorite payment method: \(paymentMethods[selectedPaymentIndex])")
                .onAppear(){
                    print(settings.count)
                    //selectedPaymentIndex = settings[0].agreeToTerm
                    switch settings[0].payment{
                    case "Paypal": selectedPaymentIndex = 0
                    case "Apple Pay": selectedPaymentIndex = 1
                    case "Google Pay": selectedPaymentIndex = 2
                    case "VISA": selectedPaymentIndex = 3
                    default: selectedPaymentIndex = 0
                    }
                }
                .onChange(of: selectedPaymentIndex) { _Index in
                    updatePaymentSetting(selected: _Index) }
                
           Spacer()
        }.custombackbtn()
                
       
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
