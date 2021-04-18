//
//  LogoViewModifier.swift
//  Sparkle
//
//  Created by ying kit ng on 4/18/21.
//

import SwiftUI

struct FilledButtonViewModifier: ViewModifier{
   
    func body( content: Content) -> some View {
        content
            .font(.custom("Times New Roman", size: 25))
            .shadow(color: Color.green.opacity(0.4), radius: 3, x: 1, y: 2)
            .frame(width: 260, height: 28 ,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 1))
            .background(Color( red: 36/255, green: 106/255, blue: 93/255, opacity: 1))
            .cornerRadius(25)
            .foregroundColor(.white)
    
    }
    
 
}

extension View {
    func sparklefilledbutton() -> some View {
        self.modifier(FilledButtonViewModifier())
        
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
