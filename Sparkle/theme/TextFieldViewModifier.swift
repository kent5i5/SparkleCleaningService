//
//  FilledButtonLightViewModifier.swift
//  Sparkle
//
//  Created by ying kit ng on 4/18/21.
//

import SwiftUI

struct TextFieldViewModifier: ViewModifier{
   
    func body( content: Content) -> some View {
        content
            .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(EdgeInsets(top:8, leading: 16,
                                bottom:8, trailing:0 ))
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 2))
    
    }
    
 
}

extension View {
    func sparkletextfield() -> some View {
        self.modifier(TextFieldViewModifier())
        
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
