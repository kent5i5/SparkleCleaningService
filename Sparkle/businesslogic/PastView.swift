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
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter }()
    
//    init(favorite: Favorite){
//        self.favorite = favorite
//    }
    
    var body: some View {
       
        VStack {
           
            if serviceData.serivces.isEmpty{
                Text("No Job History, Please Log in" )
            } else {
            ForEach(serviceData.serivces){ service in
                
                NavigationLink(destination: JobDetailsView(service: service) ){
                    VStack {
                        
                        HStack {
                            Text("JobID: " ).frame( alignment: .leading).font(.title3).foregroundColor(.green)
                            Text(service.id).frame( alignment: .leading).font(.caption).foregroundColor(.black)
                           
                        }
                        Divider()
                        HStack {
//                            Text("Title: "  ).frame( alignment: .leading).font(.body).foregroundColor(.green)
//                            Text( service.name).frame( alignment: .leading).font(.body).foregroundColor(.black)
//                            Spacer()
                            Text("Status: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                            Text("DONE") .font(.subheadline)

                        }
                        Divider().border(Color.green, width: 2)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.green)
  
                    }.padding()
                   
        
                }

               
            }
            }
           

        }.padding()

    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
       // PastView(favorite: Favorite(name: "", duration: 0.0))
        PastView()
    }
}
