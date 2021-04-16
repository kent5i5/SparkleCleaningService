//
//  EventView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/14/21.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Aug")
                    
                Text("15").bold()
                    
            }.padding(EdgeInsets(top:0, leading: 16,
                                 bottom:0, trailing:16 ))
            Text("Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward").font(.caption2)
                
        }.frame(width: 300, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        //.shadow(color: Color.gray.opacity(0.6), radius: 5, x: 10, y: 20)
        .padding(EdgeInsets(top:0, leading: 16,
                            bottom:0, trailing:16 ))
        .background(Theme.init().yellow)
        .cornerRadius(45)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
