//
//  ArrivalTimeFormUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ArrivalTimeFormUIView: View {
    @ObservedObject var navigate: serviceNavigator
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var serviceData: ServiceRepository
    
    @Binding var start: Date
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
    
//    init(currentStep: Binding<Int> ){
//        self._currentStep = currentStep
//    }
    var body: some View {
       
            VStack {
                VStack {
                    Text("Requested Arrival Time of the Cleaner")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Button(action: {resetView()}){
                        Text("clear all")
                            .font(.body)
                            .fontWeight(.light)
                            .frame(width: 300, alignment: .trailing)
                    }.padding()
                }
               
                DatePicker(selection: $start ,in: Date()..., displayedComponents:  [.date, .hourAndMinute], label: {
                    Text("Select a date")
                        .font(.title3)
                })
                
//                DatePicker("Start Time:", selection: $serviceData.startDate, in: Date()...,
//                           displayedComponents:  [.date, .hourAndMinute] )
//                    .datePickerStyle(GraphicalDatePickerStyle())
//                    .accentColor(colorScheme == .light ? Theme.init().lightGreen : Theme.init().yellow)
//                    .foregroundColor(Theme.init().darkGreen)
            
                
                
//                    .background(Theme.init().darkGreen)
//                    .foregroundColor(.white)
//                    .accentColor(colorScheme == .light ? Theme.init().lightGreen : Theme.init().yellow)
                
               // DatePicker("End:", selection: $serviceData.endDate,in: Date()...)
                    //.datePickerStyle( WheelDatePickerStyle())
                Spacer()
                
                GeometryReader { geometry in
                    Text("").toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            HStack{
                                Button(action: {navigate.previousView()}){
                                    Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                                }.offset(x: 20, y: 0)
                                Spacer()
                                Button(action: {navigate.nextView(nextView: "LocationFormUIView")}){
                                                        //Image("chevron-top")
                                                        Text("NEXT")
                                                            .foregroundColor(.white)
                                                                .padding()
                                                                .cornerRadius(8)
                                                     }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                Button(action: {navigate.nextView(nextView: "LocationFormUIView")}){
                                    Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                                }.offset(x: -20, y: 0)
                            }.background(Theme.init().darkGreen)
                            .frame(width: geometry.size.width, alignment: .top)
                        }
                    }
                }
                
            }.foregroundColor(Theme.init().darkGreen)

        
        
    }
}

//struct ArrivalTimeFormUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArrivalTimeFormUIView()
//    }
//}
