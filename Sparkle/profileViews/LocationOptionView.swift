//
//  LocationOptionView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/9/21.
//

import SwiftUI

struct Todo: Identifiable, Equatable {
    let id = UUID()
    let description: String
    var done: Bool
    
}


extension Array where Element == Todo {
    mutating func toggleDone(to todo: Todo) {
        guard let index = self.firstIndex( where: { $0 == todo } )
        else { return }

        self[index].done.toggle()
    }

}

struct LocationOptionView: View {
    @Environment(\.managedObjectContext) var context
    @State private var trackingLocation = false
    
    private var todos: [Todo] = [ .init(description: "review first chapter",    done: false),
                                  .init(description: "buy food", done: false),
                                  .init(description: "sleep over nigth", done: false) ]
                           
    
    @FetchRequest(

      entity: Settings.entity(),

      sortDescriptors: [
        NSSortDescriptor(keyPath: \Settings.notification, ascending: true)
      ]

    ) var settings: FetchedResults<Settings>
    
    private func updateLocationSetting(){

        do {
           // self.context.delete(settings[0])
            settings[0].location = trackingLocation
          try context.save()
        } catch {
          print("Error saving managed object context: \(error)")
        }
        
      
    }
                          

    var body: some View {
        Form {
            Section {
                Text("Location privacy").custombackbtn()
                Toggle("Turn on/off location tracking", isOn: $trackingLocation)
                    .foregroundColor(trackingLocation  ? .green : .gray)
                    .onAppear(){
                        print(settings.count)
                        trackingLocation = settings[0].location
                    }
                    .onChange(of: trackingLocation) { _isOn in
                        updateLocationSetting() }
                Spacer()
                
            }
        }
        

//        List {
//            ForEach(todos){ todo in
//                HStack{
//                    Text(todo.description).strikethrough(todo.done)
//                    Image(systemName: todo.done ? "check-square" : "square")
//                }.contentShape(Rectangle()).onTapGesture {
//                    print("tap")
//
//                }
//
//            }
//        }
    }
}

struct LocationOptionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationOptionView()
    }
}
