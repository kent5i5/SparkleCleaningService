//
//  PromoView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI

struct PromoView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    @State private var isPromo = false
    @State private var selectedPromoIndex = 0
    let options = ["once", "twice", "three times"]
    
    @FetchRequest(

      entity: Settings.entity(),

      sortDescriptors: [
        NSSortDescriptor(keyPath: \Settings.notification, ascending: true)
      ]

    ) var settings: FetchedResults<Settings>
    
    private func updatePromoSetting(){

        do {
           // self.context.delete(settings[0])
            settings[0].promo = isPromo
          try context.save()
        } catch {
          print("Error saving managed object context: \(error)")
        }
        
      
    }
    
    var body: some View {
        Form {
            Section {
                Toggle("Do you want to promotion?", isOn: $isPromo)
                    .foregroundColor(isPromo  ? .green : .gray)
                    .onAppear(){
                        print(settings.count)
                        isPromo = settings[0].promo
                    }
                    .onChange(of: isPromo) { _isPromo in
                        updatePromoSetting() }
 
                
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
        }.custombackbtn()
        
        
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView()
    }
}


