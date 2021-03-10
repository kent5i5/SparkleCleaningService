//
//  SupportView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI

struct SupportView: View {
    @State private var selectedStrength = "Mild"
    @State private var agreedToTerms = false
    let options = ["probelm1", "problem2", "problem3"]
    var body: some View {
       // Text("Technical support")
        
            Form {
                        Section {
                            Picker("Options", selection: $selectedStrength) {
                                ForEach(options, id: \.self) {
                                    Text($0)
                                }
                            }.pickerStyle(WheelPickerStyle())
                        }
            
                Section {
                    Toggle("Agree to terms and conditions", isOn: $agreedToTerms)
                }

                Section {
                        Button("Continue") {
                        // show next screen here
                        }.disabled(agreedToTerms == false)
                }
            }
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
