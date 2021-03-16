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
    @State private var isRequestSend = false
    let options = ["probelm1", "problem2", "problem3"]
    var body: some View {
       // Text("Technical support")
            
            Form {
                Section {
                    Picker("Options", selection: $selectedStrength) {
                            ForEach(options, id: \.self) {
                                Text($0).foregroundColor(.green)
                            }
                    }.pickerStyle(WheelPickerStyle())
                }
                
                Section {
                    TextField("500 word maximum ", text: .constant(""))
                        .cornerRadius(10)
                        .padding()
                        .border(Color.green)
                }.foregroundColor(.green)
                
                Section {
                    Toggle("Agree to terms and conditions", isOn: $agreedToTerms)
                }.foregroundColor(.green)

                Section {
                        Button("Continue") {
                            isRequestSend.toggle()
                            
                        }.disabled(agreedToTerms == false)
                    
                }
                
                if isRequestSend == true {
                    successView(isSend: $isRequestSend)
                }
                
            }
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}

struct successView: View {
    @Binding var isSend: Bool
    
//    init(isRequest: Binding<String>){
//        self.isRequest = isRequest
//    }
    
    var body: some View {
        Text("Message recieved")
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .foregroundColor(isSend ? .green : .white)
                
            ).foregroundColor(.green )
            
    }
}
