//
//  CalenderUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct CalenderUIView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var serviceDate: ServiceRepository
    @State var selectedDate = Date()
    
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    
    func showMenu(){
        showMenuItem3.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            showMenuItem2.toggle()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            showMenuItem1.toggle()
        })
    }
    var body: some View {
        NavigationView {
            VStack {
                    
                DatePicker("When is the starting date?", selection: $serviceDate.startDate, displayedComponents:  [.date, .hourAndMinute])
                      .datePickerStyle(GraphicalDatePickerStyle())
                     .background(Color.green)
                        .accentColor(colorScheme == .dark ? Color.secondary : Color.primary)
                     //.foregroundColor(.white)
                    
                
                Text(serviceDate.startDate.description ).frame(width: .infinity, height: 20, alignment: .bottomLeading)
                    .font(.caption)
                
                    ZStack(alignment: .bottomTrailing) {
                        Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(maxWidth: .infinity, maxHeight: .infinity)
                        NavigationLink(destination: SelectServiceUIView()) {
                            FloatingMenuUIView(showMenuItem1: false, showMenuItem2: false, showMenuItem3: false)
                                .padding()
                        }
                    }
                    
                    
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
       
    }
        
        //            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Cleaning Schedule")})
        //                .datePickerStyle(GraphicalDatePickerStyle())

}

struct CalenderUIView_Previews: PreviewProvider{
    static var previews: some View {
        CalenderUIView()
    }
}




