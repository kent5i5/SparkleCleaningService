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
    @State var jobs: [Job] = []

    // 1
    @FetchRequest(
      // 2
      entity: Job.entity(),
      // 3
      sortDescriptors: [
        NSSortDescriptor(keyPath: \Job.name, ascending: true)
      ]
    // 4
    ) var joblist: FetchedResults<Job>
    
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
    
    var favorite: Favorite
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter }()


    var body: some View {
       
        VStack {
            
            if favorite.name.isEmpty {
                Text("No Job History, Please Log in" )
            } else {
                
                HStack {
                    Text("JobID: ").frame( alignment: .leading).font(.title3).foregroundColor(.green)
                    Text(favorite.id.uuidString).frame( alignment: .leading).font(.caption)
                }
                Divider()
                HStack {
                    Text("Title: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                    Text( favorite.name).font(.body)
                    Divider()
                    Text("startime: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                    Text("\(Date(), formatter: Self.taskDateFormat)") .font(.subheadline)

                    Text("endtime: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                    Text("\(Date(), formatter: Self.taskDateFormat)") .font(.subheadline)

                }
            }
            Divider().border(Color.green, width: 2)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.green)
            
//            Button(action:{
//                addJob(name: "testjob",city: "SF",country: "US")
//            }){
//                Text("addjob")
//                
//            }
            
            ForEach(joblist){ job in
                Text(verbatim: job.name ?? "")

            }
        }.padding()
       
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(favorite: Favorite(name: "", duration: 0.0))
    }
}
