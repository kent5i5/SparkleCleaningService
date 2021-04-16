//
//  ArrivalTimeFormUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ArrivalTimeFormUIView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
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
                    }.background(Theme.init().darkGreen)
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
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
                
                DatePicker("Start Time:", selection: $serviceData.startDate, in: Date()...,
                           displayedComponents:  [.date, .hourAndMinute])
                    .datePickerStyle(CompactDatePickerStyle())
                    .frame(height: 50)
                    .accentColor(colorScheme == .light ? Theme.init().lightGreen : Theme.init().yellow)
                    .foregroundColor(Theme.init().darkGreen)
//                    .datePickerStyle(GraphicalDatePickerStyle() )
//                    .background(Theme.init().darkGreen)
//                    .foregroundColor(.white)
//                    .accentColor(colorScheme == .light ? Theme.init().lightGreen : Theme.init().yellow)
                
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

                
            }.foregroundColor(Theme.init().darkGreen)

        
        
    }
}

//struct ArrivalTimeFormUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArrivalTimeFormUIView()
//    }
//}
