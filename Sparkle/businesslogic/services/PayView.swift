//
//  PayView.swift
//  Sparkle
//
//  Created by ying kit ng on 4/16/21.
//

import SwiftUI

struct PayView: View {
    @ObservedObject var navigate: serviceNavigator
    
    var body: some View {
       
      
        VStack {
            Text("Select your payment methods ")
                .font(.title)
                .fontWeight(.bold)
                .frame( height: 60, alignment: .leading)
                .padding(EdgeInsets(top:0, leading: 16,
                                    bottom:16, trailing:0 ))
            
            Text("Payments")
            HStack {
                Image(systemName: "cross")
                Text("Apple Pay")
                Spacer()
                
            }.padding()//.background(Color.white)
            
            
            HStack {
                Image(systemName: "cross")
                Text("􀣜 Credit Card")
                Spacer()
                
            }.padding()
            //.background(Color.white)
            
            
            HStack {
                Image(systemName: "cross")
                Text("Gift Card")
                Spacer()
            }.padding()//.background(Color.white)
        }.background(Theme.init().darkGreen)
        
        
        GeometryReader { geometry in
            Text("").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                       
                        Spacer()
                        Button(action: {navigate.nextView(nextView: "ConfirmPayView")}){
                                                //Image("chevron-top")
                                                Text("OK")
                                                    .foregroundColor(.white)
                                                        .padding()
                                                        .cornerRadius(8)
                                             }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                       
                    }.background(Theme.init().darkGreen)
                    .frame(width: geometry.size.width, alignment: .top)
                }
            }
        }
    }
}

//struct PayView_Previews: PreviewProvider {
//    static var previews: some View {
//        PayView()
//    }
//}
