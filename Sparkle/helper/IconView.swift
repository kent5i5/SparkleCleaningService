//
//  IconView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/21/21.
//

import SwiftUI

struct IconView: View {
    let iconName: String
    let isSelected: Bool
    
    
    var body: some View {
    
                VStack {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 2)
                                .foregroundColor(isSelected  ? .green : .white)
                            
                        ).overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 2)
                                .foregroundColor(isSelected  ? .green : .black)
                            
                        )

                        Text(iconName)
                }

    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        
        IconView( iconName: "applescript",isSelected: true)
    }
}
