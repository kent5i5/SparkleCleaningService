//
//  ServiceRepository.swift
//  Sparkle
//
//  Created by ying kit ng on 3/24/21.
//

import Firebase

class ServiceRepository: ObservableObject{
    @Published var serivces: [Service] = []
    private let db = Firestore.firestore()
    
    init(){
        loadAllService()
    }
    
    func newService(name: String , date: Date, address: String, country: String, city: String){
        db.collection("Service").addDocument(
            data: ["name" : name, "date": date, "address": address, "country": country, "city": city])
    }
    
    private func loadAllService(){
        db.collection("Services").getDocuments{ (snapshot,error) in
            if let error = error {
                print(error)
                return
            }
            guard let documents = snapshot?.documents else {
                return
            }
            
            self.serivces = documents.compactMap{ document in
                let data = document.data()
                guard let name = data["name"] as? String, let date = data["date"] as? Date, let address = data["address"] as? String,
                      let country = data["country"] as? String, let city = data["city"] as? String else {
                    return nil
                }
                return Service(name: name, date: date, address: address, country: country, city: city)
            }
            
            
            
        }
        
       
    }
    
    func remove(at index: Int){
        let serviceToDelete = serivces[index]
        
        db.collection("notes").document(serviceToDelete.id).delete()
    }
}
