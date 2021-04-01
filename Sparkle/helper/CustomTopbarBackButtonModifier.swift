//
//  BackButtonView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/31/21.
//

import SwiftUI




struct CustomTopbarBackButtonModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
  func body(content: Content) -> some View {
    content
        .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }) {
                                        HStack {
                                            Image(systemName: "arrow.left.circle").foregroundColor(.green)
                                            Text("").foregroundColor(.green)
                                        }
                                }).navigationBarBackButtonHidden(true)
  }
}

extension View {
  func custombackbtn() -> some View {
    ModifiedContent(content: self, modifier: CustomTopbarBackButtonModifier())
  }
}



