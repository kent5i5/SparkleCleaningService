//
//  FloatingMenuUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct FloatingMenuUIView: View {
    @State var showMenuItem1: Bool
    @State var showMenuItem2: Bool
    @State var showMenuItem3: Bool
    
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
        VStack {
            
            Spacer()
            if showMenuItem1 {
                MenuItem(icon: "camera.fill")
            }
            if showMenuItem2 {
                MenuItem(icon: "photo.on.rectangle")
            }
            if showMenuItem3 {
                MenuItem(icon: "square.and.arrow.up.fill")
            }

            
//            Button (action: {
//                self.showMenu()
//            }){
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(red: 0/255, green: 255/255, blue: 10/255))
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
           // }
        }
    }
}

struct MenuItem: View {
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                .frame(width: 55, height: 55)
            Image(icon)
                .imageScale(.large)
                .foregroundColor(.white)
        }.shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        .transition(.move(edge: .trailing))
    }
}


struct FloatingMenuUIView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenuUIView(showMenuItem1: false, showMenuItem2: false, showMenuItem3: false)
    }
}
