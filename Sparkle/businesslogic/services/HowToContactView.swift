//
//  HowToContactView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct HowToContactView: View {
    @EnvironmentObject var modelData: User
    @EnvironmentObject var serviceData: ServiceRepository
    
    @ObservedObject var navigate: serviceNavigator
    @Binding var fullname: String
    @Binding var phone: String
    
    func resetView(){
        self.fullname = ""
        self.phone = ""
    }
    var body: some View {
        VStack {
            Text("How to contact you?").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold() .padding(EdgeInsets(top:8, leading: 16,bottom:60, trailing:0 ))
            
            Button(action: {resetView()}){
                Text("clear all")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 300, alignment: .trailing)
            }.padding()
            
            HStack{
                Text("Full Name").bold().offset(x:60)
                Spacer()
            }
            
            TextField(" ", text: $fullname)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:16, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Theme.init().darkGreen))
            
            HStack{
                Text("Mobile Phone").bold().offset(x:60)
                Spacer()
            }
            
            TextField(" ", text: $phone)
                .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                .padding(EdgeInsets(top:8, leading: 16,
                                    bottom:16, trailing:0 ))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Theme.init().darkGreen))
        }
        
        
        
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                       
                        Spacer()
                        Button(action: {navigate.nextView(nextView: "ArrivalTimeFormUIView")}){
                                                //Image("chevron-top")
                                                Text("NEXT")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        Button(action: {navigate.nextView(nextView: "ArrivalTimeFormUIView")}){
                            Image(systemName: "chevron.right").frame(width: 10).foregroundColor(.white)
                        }.offset(x: -20, y: 0)
                    }.background(Theme.init().darkGreen)
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
    }
}

//struct HowToContactView_Previews: PreviewProvider {
//    static var previews: some View {
//        HowToContactView()
//    }
//}
