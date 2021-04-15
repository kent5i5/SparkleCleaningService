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
                    
            }
            Text("Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution.").font(.caption2)
        }.frame(width: 300, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
        .padding(EdgeInsets(top:8, leading: 16,
                            bottom:8, trailing:0 ))
        .background(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.green))
       
        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
