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
    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    func resetView(){
        currentStep = 1

    }
    
    init(currentStep: Binding<Int> ){
        self._currentStep = currentStep
    }
    var body: some View {
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Button(action: {previousView()}){
                            Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                        }.offset(x: 20, y: 0)
                        Spacer()
                        Button(action: {nextView()}){
                                                //Image("chevron-top")
                                                Text("NEXT")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        Button(action: {nextView()}){
                            Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                        }.offset(x: -20, y: 0)
                    }.background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
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
                }.padding()
                
                DatePicker("Begin:", selection: $serviceData.startDate, in: Date()...,
                           displayedComponents:  [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle() )
                   
                
               // DatePicker("End:", selection: $serviceData.endDate,in: Date()...)
                    //.datePickerStyle( WheelDatePickerStyle())
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
