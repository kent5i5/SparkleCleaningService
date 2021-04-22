//
//  Worker.swift
//  Sparkle
//
//  Created by ying kit ng on 4/18/21.
//
import SwiftUI
import Firebase


struct Worker: Identifiable {
  let id = UUID()
  let name: String
    let price: Double
    let picture: String
    let limit: Double
    let type: String
    let intro: String
  var isSelected: Bool

}



class WorkerRepository: ObservableObject {
    @Published var workers: [Worker]
    @Published var selectedWorker: Worker
    
    private let db = Firestore.firestore()
    
    init(){
        
        self.workers = []
        self.selectedWorker = Worker(name: "", price: 0, picture: "", limit: 0, type: "", intro: "", isSelected: false)
       // loadWorkers()
    }

    //var workersOfTheEmployer: [Worker] = []
    
    func findTheWorker(completing: @escaping (Bool) -> Void)    {
        // Initialize the DispatchGroup
        let group = DispatchGroup()

        // Enter the group outside of the getDocuments call
        group.enter()
        
       // var worker = Worker(name: "", price: 0, picture: "", limit: 0, type: "", intro: "", isSelected: false)
       db.collection("workers").whereField("price", isEqualTo: 150)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completing(false)
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        var data = document.data()
                        self.selectedWorker = Worker(name: data["name"] as! String , price: data["price"] as! Double, picture: data["picture"] as! String , limit: data["limit"] as! Double, type: data["type"] as! String, intro: data["intro"] as! String, isSelected: false)
                    }
                    
                }
                // leave the group when done
                group.leave()
            
        }
        // Continue in here when done above
                group.notify(queue: DispatchQueue.global(qos: .background)) {
                    print("all names returned, we can continue")
                    completing(true)
                }
       
    }
    
    func getWorkerList() -> [Worker]{
        return self.workers
    }

    /// retrieves all the services from `workers` collection
    //func loadWorkers(completion: @escaping ([Worker]) -> Void){
        
   func loadWorkers() {
        let workersRef = db.collection("workers")
        
       workersRef.getDocuments{ (snapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
               // completion(self.workers)
                       
            } else {
                for document in snapshot!.documents {
                   // print("\(document.documentID) => \(document.data())")
                
                        // needs to quard each datas
                    let worker = Worker(name:  document["name"] as! String, price: document["price"] as! Double  ,  picture:  document["picture"] as! String,
                                         limit:  document["limit"] as! Double , type: document["type"] as! String, intro: document["intro"] as! String , isSelected: false)
                   
                   
                    self.workers.append(worker)
                    print(self.workers.description)
                  
                }
               // completion(self.workers)
            }
           
        }
   
    }
}
