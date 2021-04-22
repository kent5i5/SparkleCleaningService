//
//  SearchView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var navigate: serviceNavigator
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @EnvironmentObject var workerData: WorkerRepository
    @Binding var selectedUser: Worker

    @Binding var additioalInformation: String
    
    
    @State private var selectedNone = false
    @State var isSearching = false
    
    func startSearch(){
        self.isSearching = true
        if modelData.uid.isEmpty {
                /*
                 Black Box  - Algorithm that find the best cleaner for the customer
                 */
            
            let group = DispatchGroup()
            group.enter()
           // DispatchQueue.main.async() {
                workerData.findTheWorker() { isSucceeded in
                    
                    // Only leave when dispatchGroup returns the escaping bool
                    
                    if isSucceeded {
                        group.leave()
                    } else {
                        // returned false
                        group.leave()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() ) {
                   
                        selectedUser = workerData.selectedWorker
                        self.navigate.nextView(nextView: "SelectCleanerView")
                    }
                }
           // }
           
           
        } else {
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                
                
              
                    workerData.loadWorkers()
                
                
                self.navigate.nextView(nextView: "SelectCleanerView")
            }
        }
        
    }
    
    var body: some View {

        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Spacer()
                        Button(action: { startSearch()  }){
 
                                                Text("SEARCH")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                         Spacer()
                    }.background(Theme.init().darkGreen)
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
        if isSearching {
            
            Image("sparkle")

            Text("Please Wait... ")
            Text("We are searching house keeper for you ")
        }
        
        if !isSearching {
            VStack {
                
                Text("Is there any additional information you want to tell?")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(EdgeInsets(top:8, leading: 16,
                                         bottom:60, trailing:0 ))
                
                Group {
                    HStack{
                        Text("").bold()
                        Spacer()
                    }
                
                    VStack {
                        TextEditor( text: $additioalInformation)
                             .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Theme.init().darkGreen, lineWidth: 2)
                                        )
                        
                        HStack {
                            Image(systemName: selectedNone ? "largecircle.fill.circle" : "circle").onTapGesture {
                                selectedNone.toggle()
                                if selectedNone{
                                    additioalInformation = ""
                                }
                            }
                            Text("NONE").bold()
                            Spacer()
                        }.frame(width: 300)
                    }.padding()
                        //.shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                        
                   
                   
                }
              
               
                Spacer()

            }.foregroundColor(Theme.init().darkGreen)
        }
 
    }
}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
