//
//  ArrivalTimeFormUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ArrivalTimeFormUIView: View {
    @EnvironmentObject var serviceData: ServiceRepository
    @Binding var currentStep: Int
    
    func resetView(){
        currentStep = 1

    }
    
    init(currentStep: Binding<Int> ){
        self._currentStep = currentStep
    }
    var body: some View {
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
                
                DatePicker("Please enter start time", selection: $serviceData.startDate,
                           displayedComponents:  [.date, .hourAndMinute])
                    .datePickerStyle( WheelDatePickerStyle())
                   
                
                DatePicker("Please enter end time", selection: $serviceData.endDate)
                    .datePickerStyle( WheelDatePickerStyle())
                Spacer()
                
//                TextField("Search", text: .constant(""))
//                    .frame(height: 40, alignment: .center)
//                    .cornerRadius(10)
//                    .border(Color.green)
//                    .padding(10)
//
//                TextField("Search", text: .constant(""))
//                    .frame(height: 40, alignment: .center)
//                    .cornerRadius(10)
//                    .border(Color.green)
//                    .padding(10)
                
            }

        
        
    }
}

//struct ArrivalTimeFormUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArrivalTimeFormUIView()
//    }
//}
