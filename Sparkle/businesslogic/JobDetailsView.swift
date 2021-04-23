//
//  JobDetailsView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/29/21.
//

import SwiftUI

struct JobDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
     var service:Service
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter }()
    var body: some View {
       
        VStack {
            Text("")
                .navigationBarTitleDisplayMode(.automatic)
                        .toolbar { // <2>
                            ToolbarItem(placement: .principal) { // <3>
                                VStack {
                                    Text("Job Details").font(.title).foregroundColor(.green)
                                    Divider().foregroundColor(.green)
                                }
                            }
                            
                    }
                .navigationBarItems(leading:
                                        Button(action: {
                                            self.presentationMode.wrappedValue.dismiss()
                                        }) {
                                            HStack {
                                                Image(systemName: "chevron.left").foregroundColor(.green)
                                                //Text("CANCEL").foregroundColor(.green)
                                            }
                                    }).navigationBarBackButtonHidden(true)
                
       
            
            VStack {
                //Text("Job Details").font(.title).foregroundColor(.green)
                HStack {
                    Text("JobID: " ).frame( alignment: .leading).font(.title3)
                        .foregroundColor(.green).padding()
                    Text(service.id).frame( alignment: .leading).font(.caption)
                    Spacer()
                }
                Divider().foregroundColor(.green)
                HStack {
                    Text("Street: "  ).frame( alignment: .leading).font(.body)
                        .foregroundColor(.green).padding()
                    Text( service.street).frame( alignment: .leading).font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("Apt/Uion: "  ).frame( alignment: .leading).font(.body)
                        .foregroundColor(.green).padding()
                    Text( service.apt).frame( alignment: .leading).font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("Zip Code: "  ).frame( alignment: .leading).font(.body)
                        .foregroundColor(.green).padding()
                    Text( service.zipcode).frame( alignment: .leading).font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("From: " ).frame( alignment: .leading).font(.body)
                        .foregroundColor(.green).padding()
                    Text("\(service.startdate)") .font(.subheadline)

                    Text("To: " ).frame( alignment: .leading).font(.body)
                    Text("\(service.enddate)") .font(.subheadline)
                   
                }
               
            }
           
            Divider().border(Color.green, width: 2).foregroundColor(.green)
            ScrollView(.horizontal, showsIndicators: false, content:{
                HStack {
                ForEach(0..<service.type.count){ at in
                    
                        //Text("Type: "  ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                        let type = service.type[at]
                        //Text(verbatim:  type).font(.body)
                    IconView(iconName: type, isSelected: false).padding()

                }
                  
                }
            })
            Spacer()
        }
    }
}
//
//struct JobDetailsView_Previews: PreviewProvider {
//   
//    static var previews: some View {
//        JobDetailsView(service: Service(id: "", name: "", address: "", country: "", city: "", street: "", apt: "", zipcode: "", type: [], startdate: Date(), enddate: Date()))
//    }
//}
