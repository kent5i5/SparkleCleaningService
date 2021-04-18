//
//  FilledButtonLightViewModifier.swift
//  Sparkle
//
//  Created by ying kit ng on 4/18/21.
//

import SwiftUI

struct FilledButtonLightViewModifier: ViewModifier{
   
    func body( content: Content) -> some View {
        content
            .font(.custom("Times New Roman", size: 25))
            .shadow(color: Color.green.opacity(0.4), radius: 3, x: 1, y: 2)
            .frame(width: 260, height: 28 ,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
            .background( Color( red: 130/255, green: 176/255, blue: 40/255, opacity: 1))
            .cornerRadius(25)
            .foregroundColor(.white)
    
    }
    
 
}

extension View {
    func sparklefilledlightbutton() -> some View {
        self.modifier(FilledButtonLightViewModifier())
        
    }
}
//extension View{
//    func sparklefilledbutton() -> some View{
//        ModifiedContent(
//            content: TextField("", text: $name),
//            modifier: FilledButtonViewModifier()
//        )
//    }
//}
