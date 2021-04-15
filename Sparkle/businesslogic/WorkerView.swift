//
//  SearchWorkerView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/14/21.
//

import SwiftUI

struct WorkerView: View {
    //  worker data is needed
    @Binding var userPicture: String
    var body: some View {
        HStack(spacing:0) {
           // CircleImageView(iconName: "user")
            VStack {
               
                HStack {
                    VStack {
                        Text("Cleaner: ").frame( alignment: .leading).font(.title3).foregroundColor(.green)
//                        Image( "user").resizable()
//                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .overlay( Circle().stroke(lineWidth: 2).foregroundColor(.black))
//                            .foregroundColor(.green)
                        CircleImageView( iconName: userPicture)
                            .frame(width: 100, height: 100)
                        Text("Book").frame(width: 60, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.green, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(8)
                        
                        //Text(favorite.id.uuidString).frame( alignment: .leading).font(.caption)
                    }.padding()
                    
                    //Divider()
                    VStack {
                        HStack {
                            Text("Rating: " ).frame( alignment: .leading).font(.body)
                                .padding(EdgeInsets(top:32, leading: 8,
                                                    bottom:8, trailing:0 ))
                                .foregroundColor(.green)
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
                                                    .font(.body).foregroundColor(.green)
                        //Text("\(Date(), formatter: Self.taskDateFormat)") .font(.subheadline)
                        
                        Text(" " ).frame( alignment: .leading)
                            .padding()
                            .font(.body).foregroundColor(.green)
                        //Text("\(Date(), formatter: Self.taskDateFormat)") .font(.subheadline)
                        
                        Text("Name").frame( alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        Spacer()

                    }
                    //Spacer()
        
                }
                Divider()
            }.frame(minHeight: 180, alignment: .leading)
            .background(Color.gray.opacity(0.5), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            
        }.offset(x: -2, y: 0)
    }
}

//struct WorkerView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkerView()
//    }
//}
