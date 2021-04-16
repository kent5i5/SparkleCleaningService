//
//  ReviewView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/15/21.
//

import SwiftUI

struct ReviewView: View {
    var userPicture: String
    var userName: String
    var content: String
    var body: some View {
        // CircleImageView(iconName: "user")
         VStack {
            
             HStack {
                 VStack {
                     CircleImageView( iconName: userPicture)
                         .frame(width: 100, height: 100)
                    Text(userName)
                         
                 }.padding()
                 
                 //Divider()
                 VStack {
                     HStack {
                         Text("Rating: " ).frame( alignment: .leading).font(.body)
                             .padding(EdgeInsets(top:32, leading: 8,
                                                 bottom:8, trailing:0 ))
                            .foregroundColor(Theme.init().darkGreen)
                         Image("rating-icon").padding(EdgeInsets(top:32, leading: 8,
                                                                 bottom:8, trailing:0 ))
                         Image("rating-icon").padding(EdgeInsets(top:32, leading: 8,
                                                                 bottom:8, trailing:0 ))
                         Image("rating-icon").padding(EdgeInsets(top:32, leading: 8,
                                                                 bottom:8, trailing:0 ))
                     }
                     
                     
                    Text( content).frame(minWidth: 260, alignment: .leading).font(.body).foregroundColor(Theme.init().darkGreen)

                     
                    Text("\(Date())").frame( alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).font(.caption2)
                         
                     Spacer()

                 }
                 //Spacer()
     
             }
             Divider()
         }.frame(minHeight: 180, alignment: .leading)
         .background(Theme.init().yellow, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
         
         
     }
}
//
//struct ReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewView()
//    }
//}
