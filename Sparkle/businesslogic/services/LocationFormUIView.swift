//
//  LocationFormUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI


struct LocationFormUIView: View {
    @ObservedObject var navigate: serviceNavigator
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
                        Button(action: {navigate.previousView()}){
                            Image(systemName: "chevron.left").frame(width: 10).foregroundColor(.white)
                        }.offset(x: 20, y: 0)
                        Spacer()
                        Button(action: {navigate.nextView(nextView: "SearchView")}){
                                                //Image("chevron-top")
                                                Text("NEXT")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        Button(action: {navigate.nextView(nextView: "SearchView")}){
                            Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                        }.offset(x: -20, y: 0)
                    }.background(Theme.init().darkGreen)
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
        VStack {
            
            Text("Where do you want cleaner go")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(EdgeInsets(top:8, leading: 16,
                                     bottom:60, trailing:0 ))
            
            Button(action: {resetView()}){
                Text("clear all")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 300, alignment: .trailing)
            }.padding()
            
            Group {
                HStack{
                    Text("Street").bold().offset(x:60)
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
                                .foregroundColor(Theme.init().darkGreen))
                   
  
                
                HStack{
                    Text("Apt / Unit").bold().offset(x:60)
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
                                .foregroundColor(Theme.init().darkGreen))
                   

                
                
                HStack{
                    Text("Zip Code").bold().offset(x:60)
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
                                .foregroundColor(Theme.init().darkGreen))
                   

                
            }
           
            Spacer()
            
            
 
        }.foregroundColor(Theme.init().darkGreen)

        
    }
}


//struct LocationFormUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationFormUIView()
//    }
//}
