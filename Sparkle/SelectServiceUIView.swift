//
//  SelectServiceUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct SelectServiceUIView: View {
    @State var showSelectService = 1
    
    func changeView(){
        showSelectService = showSelectService + 1
        
        if showSelectService == 4{
            showSelectService = 0
        }
    }
    
    var body: some View {
        ScrollView {
            
            if (showSelectService == 1){
                SelectServiceSubView()
            }
            if (showSelectService == 2){
                ArrivalTimeFormUIView()
            }
            
            if (showSelectService == 3){
                VStack {
                    Text("Where do you want cleaner go")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundColor(.green)
                    Text("clear all")
                        .font(.body)
                        .fontWeight(.light)
                        .frame(width: 300, alignment: .trailing)
                        .foregroundColor(.green)
                    
                    TextField("Street", text: .constant(""))
                        .frame(height: 40, alignment: .center)
                        .cornerRadius(10)
                        .border(Color.green)
                        .padding(10)
                    
                    TextField("Apt/Unit", text: .constant(""))
                        .frame(height: 40, alignment: .center)
                        .cornerRadius(10)
                        .border(Color.green)
                        .padding(10)
                    TextField("Zip Code", text: .constant(""))
                        .frame(height: 40, alignment: .center)
                        .cornerRadius(10)
                        .border(Color.green)
                        .padding(10)
                    
                }
            }
            
            
                 Button(action: {changeView()}){
                     Text("NEXT")
                 }.frame(maxWidth: .infinity, maxHeight: .infinity)
                 .border(Color.green)
                 .foregroundColor(.green)
                 .clipped()
                 .padding(10)
        }
    }
}

struct SelectServiceUIView_Previews: PreviewProvider {
    static var previews: some View {
        SelectServiceUIView()
    }
}

struct SelectServiceSubView: View {
    var body: some View {
        VStack {
            Text("Which room do you want to be cleaned")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 300, height: 100, alignment: .leading)
                .foregroundColor(.green)
                .padding(0.0)
            
            Text("clear all")
                .font(.body)
                .fontWeight(.light)
                .frame(width: 300, alignment: .trailing)
                .foregroundColor(.green)
            
            HStack {
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
            }.foregroundColor(.green)
            
            HStack {
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
            }.foregroundColor(.green)
            HStack {
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "homekit")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
            }.foregroundColor(.green)
            
            
        }.frame(alignment: .leading).ignoresSafeArea()
    }
}
