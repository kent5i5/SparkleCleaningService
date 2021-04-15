//
//  SelectServiceUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI
import Firebase


struct Icon: Identifiable {
  let id = UUID()
  let name: String
    let type: String
    var isSelected: Bool

}

struct SelectServiceUIView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @State var showSelectService = 1
    @State private var wakeUp = Date()
    
    @State private var additionalNote: String = ""
    
    //@State var services = ServiceRepository()
    @State var iconItem: [Icon] = [ Icon(name: "backyard",type: "backyard", isSelected: true),
                                    Icon(name: "dinningroom", type: "dinningroom", isSelected:false),
                                    Icon(name: "guestroom",type: "guestroom",  isSelected:false),
                                   Icon(name: "kidroom",type: "kidroom", isSelected:false),
                                       Icon(name: "livingroom",type: "livingroom",  isSelected:false),
                                       Icon(name: "dinningroom",type: "diningroom",  isSelected:false),
                                   Icon(name: "guestroom",type: "guestroom", isSelected:false),
                                       Icon(name: "guestroom",type: "guestroom", isSelected:false),
                                       Icon(name: "additional-work",type: "addition",  isSelected:false)]
    
    
    @State var street: String = ""
    @State var aptunit: String = ""
    @State var zipcode: String = ""
    
    func changeView(){
        showSelectService = showSelectService + 1

    }
    
    func resetView(){
        showSelectService = 1
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                if (showSelectService == 1){
                    SelectServiceSubView( currentStep: $showSelectService, iconItem: $iconItem)
                }
                if (showSelectService == 2){
                    ArrivalTimeFormUIView(currentStep: $showSelectService)
                        .environmentObject(serviceData)
                        .transition(.scale)
                }
                
                if (showSelectService == 3){
                    LocationFormUIView(currentStep: $showSelectService, street: $street, aptunit: $aptunit, zipcode: $zipcode)
                        .environmentObject(modelData)
                }
                
                if (showSelectService == 4){
                    SearchView(currentStep: $showSelectService, additioalInformation: $additionalNote)
                        .environmentObject(modelData)
                }
                if showSelectService == 5   {
                    SelectCleanerView(currentStep: $showSelectService)
                        .environmentObject(modelData)
                }
                
                if showSelectService == 6 {
                  
                        AcceptCleanerView(currentStep: $showSelectService).environmentObject(modelData)
                   
                }
                
                if (showSelectService == 7){
                    GoHomeButton(currentStep: $showSelectService, iconItem: $iconItem,  street: $street, aptunit: $aptunit, zipcode: $zipcode)
                        .environmentObject(modelData)
                        .environmentObject(serviceData)
                                    
                }
                    Text("")
                    .navigationBarItems(leading:
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                //Image(systemName: "arrow.up.circle")
                                Image(systemName: "trash")
                                    .foregroundColor(.green)
                                //Text("CANCEL").foregroundColor(.green)
                            }
                        })
                        .navigationBarTitle("", displayMode: .inline)
                
                
//                if (showSelectService < 4) {
//                     Button(action: {changeView()}){
//                        //Image("chevron-top")
//                        Text("NEXT")
//                            .foregroundColor(.white)
//                                .padding()
//                                .background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
//                                .cornerRadius(8)
//                     }.frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .foregroundColor(.green)
//                        .navigationBarTitle("", displayMode: .inline)
//
//                }
                
            }

        }.navigationBarHidden(true)
    }
}

struct SelectServiceUIView_Previews: PreviewProvider {
    static var previews: some View {
        SelectServiceUIView()
    }
}

struct SelectServiceSubView: View {
    @Binding var currentStep: Int
    @Binding var iconItem: [Icon]

    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    func resetView(){
        for i in 0..<iconItem.count {
            
            iconItem[i].isSelected = false
        }

    }
    
    init(currentStep: Binding<Int>, iconItem: Binding<[Icon]>){
        self._currentStep = currentStep
        self._iconItem = iconItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Text("Which room do you want to be cleaned")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame( height: 100, alignment: .leading)
                    .foregroundColor(.green)
                    .padding(EdgeInsets(top:0, leading: 16,
                                        bottom:60, trailing:0 ))
               
                Button(action: {resetView()}){
                    Text("clear all")
                        .font(.body)
                        .fontWeight(.light)
                        .frame(width: 300, alignment: .trailing)
                        .foregroundColor(.green)
                }.padding()
                
                
                HStack {
                    ForEach(0..<3) { index in
                            
                        CheckView(iconItem: $iconItem, numItem: index)

                    }
                }
                HStack {
                    ForEach(3..<6) { index in
                        
                        CheckView(iconItem: $iconItem , numItem: index)

                    }
                }
                HStack {
                    ForEach(6..<9) {  index in

                        CheckView(iconItem: $iconItem, numItem: index )

                    }
                }
                
                Spacer()
                
                Text("").toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack{
            
                            Spacer()
                            Button(action: {nextView()}){
                                                    //Image("chevron-top")
                                                    Text("NEXT")
                                                        .foregroundColor(.white)
                                                            .padding()
                                                            .cornerRadius(8)
                                                 }.frame(maxWidth: .infinity, maxHeight: .infinity)
                            Button(action: {nextView()}){
                                Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                            }.offset(x: -20, y: 0)
                        } .background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                        .frame(width: geometry.size.width, alignment: .top)
                    }
                }
                
                Text("Total time: 4").padding()
              
            }.frame(alignment: .leading).ignoresSafeArea()
        }
      
    }
}

struct LocationFormUIView: View {
    
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @Binding var currentStep: Int
    @Binding var street: String
    @Binding var aptunit: String
    @Binding var zipcode: String
    
    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    func resetView(){
        currentStep = 1

    }
    
//    init(currentStep: Binding<Int>){
//        self._currentStep = currentStep
//    }
    
    var body: some View {
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Button(action: {previousView()}){
                            Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                        }.offset(x: 20, y: 0)
                        Spacer()
                        Button(action: {nextView()}){
                                                //Image("chevron-top")
                                                Text("NEXT")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        Button(action: {nextView()}){
                            Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                        }.offset(x: -20, y: 0)
                    }.background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                    .frame(width: geometry.size.width, alignment: .top)
                }
        }
        VStack {
            
            Text("Where do you want cleaner go")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.green)
                .padding(EdgeInsets(top:8, leading: 16,
                                     bottom:60, trailing:0 ))
            
            Button(action: {resetView()}){
                Text("clear all")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(.green)
            }.padding()
            
            Group {
                HStack{
                    Text("Street").bold()
                    Spacer()
                }
                
                TextField("Street: ", text: $street)
                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                    .padding(EdgeInsets(top:8, leading: 16,
                                        bottom:16, trailing:0 ))
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.green))
                   
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                
                HStack{
                    Text("Apt / Unit").bold()
                    Spacer()
                }
                TextField("Apt/Unit: ", text: $aptunit)
                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                    .padding(EdgeInsets(top:8, leading: 16,
                                        bottom:16, trailing:0 ))
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.green))
                   
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                
                
                HStack{
                    Text("Zip Code").bold()
                    Spacer()
                }
                
                TextField("Zip Code: ", text: $zipcode)
                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                    .padding(EdgeInsets(top:8, leading: 16,
                                        bottom:16, trailing:0 ))
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.green))
                   
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                
            }
           
            Spacer()
            
            
 
            }

        }
    }
}

struct SearchView: View {
    
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @Binding var currentStep: Int

    @Binding var additioalInformation: String
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    var body: some View {

           GeometryReader { geometry in
               Text("").toolbar {
                   ToolbarItem(placement: .bottomBar) {
                       HStack{
                           Spacer()
                           Button(action: {nextView()}){
    
                                                   Text("SEARCH")
                                                       .foregroundColor(.white)
                                                           .padding()
                                                           .cornerRadius(8)
                                                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                            Spacer()
                       }.background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                       .frame(width: geometry.size.width, alignment: .top)
                   }
           }
        }
        
        VStack {
            
            Text("Where do you want cleaner go")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.green)
                .padding(EdgeInsets(top:8, leading: 16,
                                     bottom:60, trailing:0 ))
            
    
            Group {
                HStack{
                    Text("").bold()
                    Spacer()
                }
            
                TextField(" ", text: $additioalInformation)
                    .frame(width: 300, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                    .padding(EdgeInsets(top:8, leading: 16,
                                        bottom:16, trailing:0 ))
                    .border(Color.black)
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                
                Picker(selection: $currentStep, label: Text(""), content: {
                    Text("none")
                })
                
            }
           
            Spacer()

        }
    }
}

struct SelectCleanerView: View {
    
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @Binding var currentStep: Int
    
    @State var cleanPicture: [String] = [ "cleaner-a" , "cleaner-b" , "" ]
    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    func resetView(){
        currentStep = 1

    }
    
    var body: some View {
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Button(action: {previousView()}){
                            Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                        }.offset(x: 20, y: 0)
                        Spacer()
                        Button(action: {nextView()}){
                                                //Image("chevron-top")
                                                Text("NEXT")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        Button(action: {nextView()}){
                            Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                        }.offset(x: -20, y: 0)
                    }.background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
        VStack {
            if (!modelData.uid.isEmpty){
                Text("Select a cleaner")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.green)
                    .padding(EdgeInsets(top:8, leading: 16,
                                         bottom:60, trailing:0 ))
                
        
                Group {
                    HStack{
                        Text("").bold()
                        Spacer()
                    }
                
                    WorkerView(userPicture: $cleanPicture[0])
                    WorkerView(userPicture: $cleanPicture[1])
                    
                    
                }
               
                Spacer()
              
            }
            if (modelData.uid.isEmpty) {
                Text("We have found a cleaner for you")
                //WorkerView()
           
            }
     
        }
    }
}

struct AcceptCleanerView: View {
    
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @Binding var currentStep: Int
    
    @State var cleanPicture: [String] = [ "cleaner-a" , "cleaner-b" ]
    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    
    func resetView(){
//        print(street + aptunit + zipcode)
        currentStep = 1
//        iconItem.forEach{ icon in
//            if icon.isSelected == true {}
//        }
//        street = ""
//        aptunit = ""
//        zipcode = ""
//        serviceData.startDate = Date()
//        serviceData.endDate = Date()
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                if (!modelData.uid.isEmpty){
                    CircleImageView(iconName: "user")
                        .frame(width: 100, height: 100)
            
                    Group {
                        HStack{
                            Text("").bold()
                            Spacer()
                        }
                    
                        Text("Clearn's name").font(.title)
                        Text("$20/hr")
                        
                        HStack{
                            Circle().background(Color.white)
                            Circle().background(Color.white)
                            Circle().background(Color.white)
                        }
                        
    //                    Button("Present!") {
    //                               isPresented.toggle()
    //                           }
    //                           .fullScreenCover(isPresented: $isPresented, content: videoView.init)
    //                            .rotationEffect(.degrees(0))
    //                            .padding(.bottom)
                        
                        WorkerView(userPicture: $cleanPicture[0])
                    }
                   
                    Spacer()
                    Text("").toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            HStack{
                                Button(action: {previousView()}){
                                    Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                                }.offset(x: 20, y: 0)
                                Spacer()
                                Button(action: {nextView()}){
                                                        //Image("chevron-top")
                                                        Text("NEXT")
                                                            .foregroundColor(.white)
                                                                .padding()
                                                                .cornerRadius(8)
                                                     }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                Button(action: {nextView()}){
                                    Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                                }.offset(x: -20, y: 0)
                            }.background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                            .frame(width: geometry.size.width, alignment: .top)
                        }
                    }
            
                  
                }
                if (modelData.uid.isEmpty) {
                    Text("Your cleaner has been selected")
                    WorkerView(userPicture: $cleanPicture[0])
                    Text("").toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            HStack{
                                Button(action: {previousView()}){
                                    Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                                }.offset(x: 20, y: 0)
                                Spacer()
                                Button(action: {resetView()}){
                                                        //Image("chevron-top")
                                                        Text("CONFIRM")
                                                            .foregroundColor(.white)
                                                                .padding()
                                                                .cornerRadius(8)
                                                     }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                          
                            }.background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                            .frame(width: geometry.size.width, alignment: .top)
                        }
                    }
                    
                }
                
         
            }
        }
        

    }
}

struct GoHomeButton: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    @Binding var currentStep: Int
    @Binding var iconItem: [Icon]
    @Binding var street: String
    @Binding var aptunit: String
    @Binding var zipcode: String

    @State var typeArray: [String] = []
    func addService(){
        if !modelData.uid.isEmpty {
            //let serviceHandler = ServiceRepository()
           // var typeArray: [String] = []
        
            var path = serviceData.newService(name: "service",  address: "", country: "", city: "", street: street, apt: aptunit, zipcode: zipcode, type: typeArray )
            let fbhandler = Fbhandler(modelData: modelData)
            fbhandler.storeService(sid: path )
        
        } else {
            serviceData.createService(name: "service", address: "", country: "", city: "", street: street, apt: "apt", zipcode: zipcode, type: typeArray)
            resetView()
        }
      
    }
    
    func previousView(){
        currentStep = currentStep - 1

    }
    
    func nextView(){
        currentStep = currentStep + 1

    }
    func resetView(){
        print(street + aptunit + zipcode)
        currentStep = 1
        iconItem.forEach{ icon in
            if icon.isSelected == true {}
        }
        street = ""
        aptunit = ""
        zipcode = ""
        serviceData.startDate = Date()
        serviceData.endDate = Date()
    }
    var body: some View {
        
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Button(action: {previousView()}){
                            Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                        }.offset(x: 20, y: 0)
                        Spacer()
                        Button(action: {resetView()}){
                                                //Image("chevron-top")
                                                Text("CONFIRM")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                       
                    }.background(Color.init(red: 0.1, green: 0.8, blue: 0.5))
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }

            VStack {
                Text("").onAppear(){// Fill the type array with the selected
                    iconItem.forEach{ icon in
                        if icon.isSelected == true{
                            self.typeArray.append(icon.type)
                        }
                } }
                
                
                CircleImageView(iconName: "user")
                    .frame(width: 100, height: 100)
               // Text("Types:")
               
                Group {
                    HStack {
                        Text(" - Street ").font(.caption)
                        Text(street).font(.caption)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(" - Apt/Unit " + aptunit).font(.caption)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(" - Zip Code " + zipcode).font(.caption)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(" - Start Date \(serviceData.startDate) " ).font(.caption)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(" - Start Date \( serviceData.endDate)").font(.caption)
                        Spacer()
                    }
                    Divider()
                    
                }
               
//                Button(action: {addService()}){
//                    Image(systemName: "plus")
//                        .resizable()
//                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .cornerRadius(2)
//                        .clipShape(Circle())
//                    Text(" Add the Services").font(.caption)
//                        .cornerRadius(8)
//
//                }.padding(EdgeInsets(top:8, leading: 16,
//                                     bottom:8, trailing:16 )).cornerRadius(8)
//                //.border(Color.green.opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
//                .overlay(RoundedRectangle(cornerRadius: 30)
//                            .stroke(lineWidth: 1)
//                            .foregroundColor(.green))
//                .foregroundColor(.green)
                
              
                
            }
        }


}
