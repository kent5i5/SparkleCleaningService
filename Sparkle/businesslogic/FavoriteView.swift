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
                        Text("Cleaner: ").frame( alignment: .leading).font(.title3).foregroundColor(.green)
                        Image( "user")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .mask(Circle())
                            .overlay( Circle().stroke(lineWidth: 2).foregroundColor(.black))
                            .foregroundColor(.green)
                       
                        Text(favorite.id.uuidString).frame( width: 60, alignment: .leading).font(.caption)
                    }.padding()
                   
                   // Divider()
                    VStack {
                        Text("Title: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                        Text( favorite.name).font(.body)
                       // Divider()
                        Text("startime: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                        Text("\(Date(), formatter: Self.taskDateFormat)") .font(.subheadline)
                        
                        Text("endtime: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                        Text("\(Date(), formatter: Self.taskDateFormat)") .font(.subheadline)

                    }.padding()
                    Spacer()
                    VStack {
                        Image("share-icon").rotationEffect(.degrees(180.0)).padding()
                        Spacer()

                    }.frame(alignment: .trailing)
                    
        
                }
               
            }
//           Divider().border(Color.green, width: 2)
//            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
//                .foregroundColor(.green)
            
//            Button(action:{
//                addJob(name: "testjob",city: "SF",country: "US")
//            }){
//                Text("addjob")
//                
//            }

//            ForEach(joblist){ job in
//                Text(verbatim: job.name ?? "")
//
//            }
            
            Divider()
        }
        .background(Color.gray.opacity(0.5), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
       
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(favorite: Favorite(name: "", duration: 0.0))
    }
}
