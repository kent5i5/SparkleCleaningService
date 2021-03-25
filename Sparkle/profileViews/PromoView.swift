//
//  PromoView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI

struct PromoView: View {
    @State private var isPromo = false
    @State private var selectedPromoIndex = 0
    let options = ["once", "twice", "three times"]
    var body: some View {
        Form {
            Section {
                Toggle("Do you want to promotion?", isOn: $isPromo)
                    .foregroundColor(isPromo  ? .green : .gray)
 
                
                if isPromo {
                    
                    Picker("Options", selection: $selectedPromoIndex) {
                        ForEach(options, id: \.self) {
                            Text($0).foregroundColor(isPromo  ? .green : .white)
                        }
                    }.pickerStyle(WheelPickerStyle())
                    
                    
                    Text("Other configurations").foregroundColor(isPromo  ? .green : .white)

                    
                   
                }
            }
//            .overlay(
//                RoundedRectangle(cornerRadius: 15)
//                    .stroke(lineWidth: 2)
//                    .foregroundColor(isPromo  ? .green : .white)
//                
//            )
        }
        
        
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView()
    }
}
