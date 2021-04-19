//
//  NotificationOptionView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI

struct NotificationOptionView: View {
    @Environment(\.managedObjectContext) var context
    @State private var isNotify = false
    @FetchRequest(

      entity: Settings.entity(),

      sortDescriptors: [
        NSSortDescriptor(keyPath: \Settings.notification, ascending: true)
      ]

    ) var settings: FetchedResults<Settings>
    
    private func updateNotificationSetting(){
        
        print(settings.count)

        do {
           // self.context.delete(settings[0])
            
            
            settings[0].notification = isNotify
          try context.save()
        } catch {
          print("Error saving managed object context: \(error)")
        }
        
      
    }
    var body: some View {
      
        
        Text("").onAppear(){
            print(settings[0].notification)
            if !settings.isEmpty{
                isNotify = settings[0].notification
            }
        }
        
        
      
        Form {
            Section {
               
                    
                    Toggle("Do you want to recieve news?", isOn: $isNotify)
                        .onChange(of: isNotify) { _isNotify in
                            updateNotificationSetting() }
                
               
                
                Image(systemName: isNotify ? "speaker.1.fill" : "speaker.slash.fill")
                               .font(.system(size: 56))
                               .padding()
                               .foregroundColor(isNotify  ? .green : .white)
                       
                       Spacer()
            }
        }.custombackbtn()
            
        
    }
}

struct NotificationOptionView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationOptionView()
    }
}
