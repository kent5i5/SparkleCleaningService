//
//  FavoriteView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/24/21.
//

import SwiftUI
import Firebase

struct Favorite : Identifiable {
    let id = UUID()
    let name: String
    let duration: Double
}

struct FavoriteView: View {
//    @State var jobs: [Job] = []
//
//    // 1
//    @FetchRequest(
//      // 2
//      entity: Job.entity(),
//      // 3
//      sortDescriptors: [
//        NSSortDescriptor(keyPath: \Job.name, ascending: true)
//      ]
//    // 4
//    ) var joblist: FetchedResults<Job>
    
//    func saveContext() {
//      do {
//        try context.save()
//      } catch {
//        print("Error saving managed object context: \(error)")
//      }
//    }
//    func addJob(name: String, city: String, country: String) {
//
//      let newJob = Job(context: context)
//
//
//      newJob.name = name
//      newJob.city = city
//      newJob.country = country
//
//
//      saveContext()
//    }
    
    var favorite: Worker
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter }()


    var body: some View {
       
        VStack(spacing: 0) {
            
            if favorite.name.isEmpty {
                Image("sparkle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                   
                Text("No Job History, Please Log in" ).font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding()
                Text("Add your favorite cleaner so that you can hire them easily in the future" ).font(.body).padding()
            } else {
                
                HStack {
                    VStack {
                        //Text("Cleaner: ").frame( alignment: .leading).font(.title3).foregroundColor(.green)
                        Image( favorite.picture)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .leading)
                            .mask(Circle())
                            .overlay(Circle().stroke(Theme.init().darkGreen, lineWidth: 5))
                           // .offset(y: -40)
                        Text("Book").frame(width: 60, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Theme.init().darkGreen, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                        Spacer()
                       // Text(favorite.id.uuidString).frame( width: 60, alignment: .leading).font(.caption)
                    }.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                   
                   // Divider()
                    VStack {
                        HStack {
                            Text( favorite.name).font(.body).font(.custom("Times New Roman", size: 25)).bold()
                            Spacer()
                        }
                        
                        Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat")

                    }.padding()
                    Spacer()
                    VStack {
                        Image("share-icon").padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)).offset(y: -60)
                            //.rotationEffect(.degrees(180.0)).padding()
                        Spacer()

                    }.frame(alignment: .leading)
                   
                    
        
                }
               
            }
         
            Divider()
        }.foregroundColor(Theme.init().darkGreen)
       
    }
}
 
struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(favorite: Worker(name: "Ms. Maria W.", price: 240, picture: "cleaner-a" , limit: 4, type: "House Cleaning Services", intro: "", isSelected: false))
    }
}
