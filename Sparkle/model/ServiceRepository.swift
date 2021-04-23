//
//  ServiceRepository.swift
//  Sparkle
//
//  Created by ying kit ng on 3/24/21.
//

import Firebase

class ServiceRepository: ObservableObject{
    @Published var serivces: [Service]
    @Published var startDate: Date
    @Published var endDate: Date
    @Published var thisService: Service
    private let db = Firestore.firestore()
    
    /// Initializes a new `ServiceRepository` with list of Service , startDate , and endDate Observable Objects
    init(){
        //loadAllService()
        //listentToServiceData()
        self.serivces = []
        self.startDate = Date()
        self.endDate = Date()
        self.thisService = Service(id: "", name: "", phone: "", address: "", country: "", city: "", street: "", apt: "", zipcode: "", type: [""], startdate: Date(), enddate: Date(), workerName: "")
    }
    
    func prepareServiceData(name: String, phone: String, address: String, country: String, city: String, street: String, apt: String, zipcode: String, type: Array<String>, start: Date, totalhours: Int, workerName: String){
        let id = UUID()
        let endDate: Date = Date()
        let service  = Service(id: id.description , name: name, phone: phone, address: "", country: "", city: "", street: street , apt: apt, zipcode: zipcode, type:  type, startdate: start, enddate: endDate, workerName: workerName)
        self.thisService =  service
    }

    /// Create   a  `Service` document in firestore for non-member user
    func createService(name: String, phone: String, address: String, country: String, city: String, street: String, apt: String, zipcode: String, type: Array<String>, start: Date, totalhours: Int, workerName: String){
        let citiesRef = db.collection("openservice")
        let caseid = UUID()
        citiesRef.document("\(caseid)").setData([
            "name":  name,
            "phone":  phone,
            "address": address,
            "country": country,
            "city": city,
            "street": street,
            "apt": apt,
            "zipcode": zipcode ,
            "type": type,
            "startime": start,
            "totalhours": totalhours,
            "workerName": workerName
            ])
    }
    
    /// listen to the  a  `Service` document in firestore
    func listentToServiceData(){
        db.collection("services").addSnapshotListener { (snap, err) in
                   if err != nil {
                       print((err?.localizedDescription)!)
                       return
                   } else {
                       print("no errors")
                       for i in snap!.documentChanges {
                           let id = i.document.documentID
                           let name = i.document.get("name") as! String

                          // self.data.append(Service(id: "", name: "", date: Date(), address: "", country: "", city: ""))
                       }
                      // print(self.data)
                   }
               }
    }
    
    /// creates a new `service` collectiont in firestore
    ///  - Parameters:
    ///     - name Name of the service, address Adress of the service, country: country of the service ... etc
    func newService(name: String, phone: String, address: String, country: String, city: String, street: String, apt: String, zipcode: String, type: Array<String>, workerName: String) -> String{
        var path = db.collection("services").addDocument(
            data: ["name" : name,  "phone": phone, "address": address, "country": country, "city": city, "street": street, "apt": apt, "zipcode": zipcode , "type": type, "startdate": self.startDate, "enddate": self.endDate, workerName: workerName])
        print("finsih addding service in :")
        return path.documentID.description
    }
    
    func loadServiceInfoByIds(serviceid: [String] ){
        let ref = db.collection("services")
        var servicelist: [Service] = []
        serviceid.forEach{ id in
            
            ref.document(id).getDocument{ (document, error) in
                
                if let document = document, document.exists {
                    let name = document["name"] as! String
                    let phone = document["phone"] as! String
                    let street = document["street"] as! String
                    let apt = document["apt"] as! String
                    let zipcode = document["zipcode"] as! String
                    let start = document["startdate"] as! Timestamp
                    let convertedStart = start.dateValue()
                    let stop = document["enddate"] as! Timestamp
                    let convertedStop = stop.dateValue()
                    let type = document["type"] as! [String]
                    let workerName = document["workerName"] as! String
                   // print(type)
                    servicelist.append(Service(id: id, name: name,phone: phone, address: "", country: "", city: "", street: street , apt: apt, zipcode: zipcode, type:  type, startdate: convertedStart, enddate: convertedStop, workerName: workerName))
                    //print(servicelist)
                }
                self.serivces = servicelist
                
            }
            
        }
        
    }
    
    /// retrieves all the services from `services` collection with the id of `Servicelist` collection in firestore
    func getServicelists(uid: String){
        var servicesid: [String] = []
        var serviceslist: [Service] = []
        
        let serviceRef = db.collection("servicelist").document(uid)
        
        serviceRef.getDocument{ [self](document , err) in
            if let document = document, document.exists {
//                var dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                        print("Document data: \(dataDescription)")
                
                let keys = document.data().map{ at in
                    return at.keys
                    
                }

                keys?.forEach(){ key in
                    //print(document[key] as! String )
                   
                    servicesid.append(document[key] as! String)
                    
                }
                 
                //servicesid.remove(at: 0)  //remove "" key
                    
                let serviceRepo = ServiceRepository()
                if !servicesid.isEmpty{
                    
                    loadServiceInfoByIds(serviceid: servicesid )
                   
                }
                
            }

        }

    }
    
//    private func loadAllService(){
//        db.collection("Services").getDocuments{ (snapshot,error) in
//            if let error = error {
//                print(error)
//                return
//            }
//            guard let documents = snapshot?.documents else {
//                return
//            }
//
//            self.serivces = documents.compactMap{ document in
//                let data = document.data()
//                guard let name = data["name"] as? String, let date = data["date"] as? Date, let address = data["address"] as? String,
//                      let country = data["country"] as? String, let city = data["city"] as? String, let type = data["type"] as? [String] else {
//                    return nil
//                }
//                return Service(id: document.documentID ,name: name, date: date, address: address, country: country, city: city, street: "", apt: "", zipcode: "", type: type)
//            }
//
//
//
//        }
//
//
//    }
//
//    func remove(at index: Int){
//        let serviceToDelete = serivces[index]
//
//        db.collection("notes").document(serviceToDelete.id).delete()
//    }
}
