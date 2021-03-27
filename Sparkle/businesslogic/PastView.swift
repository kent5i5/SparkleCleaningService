//
//  PastView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/24/21.
//

import SwiftUI
import Firebase

struct PastView: View {
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
   // var favorite: Favorite
    
//    init(favorite: Favorite){
//        self.favorite = favorite
//    }
    
    var body: some View {
        VStack {
            if serviceData.serivces.isEmpty{
                Text("No Job History, Please Log in" )
            } else {
            ForEach(serviceData.serivces){ service in
                
                HStack {
                    Text("JobID: " ).frame( alignment: .leading).font(.title3).foregroundColor(.green)
                    Text(service.id).frame( alignment: .leading).font(.caption)
                }
                Divider()
                HStack {
                    Text("Title: "  ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                    Text( service.name).font(.body)

                   
                }
                Divider()
                VStack {
                    ForEach(0..<service.type.count){ at in
                        Text("Type: "  ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                        Text(String(service.type[at])).font(.body)
                    }
                }
                Divider().border(Color.green, width: 2).foregroundColor(.green)
                Spacer()
            }
            }
           

        }.padding()
        //.border(Color.green)
    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
       // PastView(favorite: Favorite(name: "", duration: 0.0))
        PastView()
    }
}
