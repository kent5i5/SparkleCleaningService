//
//  SearchWorkerView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/14/21.
//

import SwiftUI

struct WorkerView: View {
    //  worker data is needed
    var userName: String
    var userPicture: String
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack(spacing:0) {
           // CircleImageView(iconName: "user")
            VStack {
               
                HStack {
                    VStack {
                       // Text("Cleaner: ").frame( alignment: .leading).font(.title3)
//                        Image( "user").resizable()
//                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .overlay( Circle().stroke(lineWidth: 2).foregroundColor(.black))
//                            .foregroundColor(.green)
                        CircleImageView( iconName: userPicture)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 12)
                            .overlay(Circle().stroke(Theme.init().darkGreen, lineWidth: 5))
                            .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                isSelected.toggle()
                            })
                            
                        Text("Book").frame(width: 60, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Theme.init().darkGreen, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                        //Text(favorite.id.uuidString).frame( alignment: .leading).font(.caption)
                    }.padding()
                    
                    //Divider()
                    VStack {
                        HStack {
                            Text("Rating: " ).frame( alignment: .leading).font(.body)
                                .padding(EdgeInsets(top:32, leading: 8,
                                                    bottom:8, trailing:0 ))
    
                            Image("rating-icon").padding(EdgeInsets(top:32, leading: 8,
                                                                    bottom:8, trailing:0 ))
                            Image("rating-icon").padding(EdgeInsets(top:32, leading: 8,
                                                                    bottom:8, trailing:0 ))
                            Image("rating-icon").padding(EdgeInsets(top:32, leading: 8,
                                                                    bottom:8, trailing:0 ))
                        }
                        
                        //Text( favorite.name).font(.body)
                                                Text("As user completed their service request, user  can share their   experience in order to receive discount. " )
                                                    .frame( alignment: .leading)
                        //Text("\(Date(), formatter: Self.taskDateFormat)") .font(.subheadline)
                        
//                        Text(" " ).frame( alignment: .leading)
//                            .padding()
//                            .font(.body).foregroundColor(.green)
                        //Text("\(Date(), formatter: Self.taskDateFormat)") .font(.subheadline)
                        
                        Text(userPicture).frame( alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Theme.init().darkGreen)
                        
                            
                        Spacer()

                    }
                    //Spacer()
        
                }
                Divider()
            }.frame(minHeight: 180, alignment: .leading)
            
            
        }.offset(x: -2, y: 0)
    }
}

//struct WorkerView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkerView()
//    }
//}
