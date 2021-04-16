//
//  CircleImageView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/14/21.
//

import SwiftUI

struct CircleImageView: View {
    var iconName: String
    //var isSelected: Bool
    var body: some View {
        Image( !iconName.isEmpty ?  iconName : "user")
            .resizable()
            .clipShape(Circle())
            .overlay( Circle().stroke(lineWidth: 2)
            .shadow(radius: 10)
            .foregroundColor(.black))
    }
}


//struct CircleImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleImageView(iconName: )
//    }
//}
