//
//  ArrivalTimeFormUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ArrivalTimeFormUIView: View {
    @Binding var currentStep: Int
    
    func resetView(){
        currentStep = 1

    }
    
    init(currentStep: Binding<Int>){
        self._currentStep = currentStep
    }
    var body: some View {
        ScrollView {
            VStack {
                Text("Requested Arrival Time of the Cleaner")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.green)
                Button(action: {resetView()}){
                    Text("clear all")
                        .font(.body)
                        .fontWeight(.light)
                        .frame(width: 300, alignment: .trailing)
                        .foregroundColor(.green)
                }
                
                TextField("Search", text: .constant(""))
                    .frame(height: 40, alignment: .center)
                    .cornerRadius(10)
                    .border(Color.green)
                    .padding(10)
                
                TextField("Search", text: .constant(""))
                    .frame(height: 40, alignment: .center)
                    .cornerRadius(10)
                    .border(Color.green)
                    .padding(10)
                
            }
        }
        
        
    }
}

//struct ArrivalTimeFormUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArrivalTimeFormUIView()
//    }
//}
