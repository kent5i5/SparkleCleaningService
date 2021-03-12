//
//  SelectServiceUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct SelectServiceUIView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showSelectService = 1
    
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
                    SelectServiceSubView(currentStep: $showSelectService)
                }
                if (showSelectService == 2){
                    ArrivalTimeFormUIView(currentStep: $showSelectService)
                }
                
                if (showSelectService == 3){
                    LocationFormUIView(currentStep: $showSelectService)
                }
                if (showSelectService == 4){
                    GoHomeButton(currentStep: $showSelectService)
//                                    .navigationBarItems(leading:
//                                        Button(action: {
//                                            self.presentationMode.wrappedValue.dismiss()
//                                        }) {
//                                            HStack {
//                                                Image(systemName: "arrow.up.circle")
//                                                    .foregroundColor(.black)
//                                                Text("DONE")
//                                                    .foregroundColor(.black)
//                                            }
//                                        }, trailing:
//                                        HStack {
//                                            Button("Favorites") {
//                                                print("Favorites tapped!")
//                                            }
//
//                                            Button("Specials") {
//                                                print("Specials tapped!")
//                                            }
//                                        })
                    
                }
                
                if(showSelectService < 4){
                     Button(action: {changeView()}){
                         Text("NEXT")
                     }.frame(maxWidth: .infinity, maxHeight: .infinity)
                     .border(Color.green)
                     .foregroundColor(.green)
                     .clipped()
                     .padding(10)
                }
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
    
    func resetView(){
        currentStep = 1

    }
    
    init(currentStep: Binding<Int>){
        self._currentStep = currentStep
    }
    
    var body: some View {
        VStack {
            Text("Which room do you want to be cleaned")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 300, height: 100, alignment: .leading)
                .foregroundColor(.green)
                .padding(0.0)
            
            Button(action: {resetView()}){
                Text("clear all")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(.green)
            }
                
            
            HStack {
                Image(systemName: "arrow.clockwise.icloud.fill")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "arrow.clockwise.icloud")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "checkmark.icloud.fill")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
            }.foregroundColor(.green)
            
            HStack {
                Image(systemName: "icloud.and.arrow.down.fill")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "icloud.circle")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "icloud.fill")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
            }.foregroundColor(.green)
            HStack {
                Image(systemName: "key.icloud.fill")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "link.icloud")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
                Image(systemName: "link.icloud.fill")
                    .resizable()
                    .padding(10)
                    .frame(width: 100, height: 100, alignment: .topLeading)
            }.foregroundColor(.green)
            
            
        }.frame(alignment: .leading).ignoresSafeArea()
    }
}

struct LocationFormUIView: View {
    @Binding var currentStep: Int
    
    func resetView(){
        currentStep = 1

    }
    
    init(currentStep: Binding<Int>){
        self._currentStep = currentStep
    }
    
    var body: some View {
        
        VStack {
            Text("Where do you want cleaner go")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.green)
            
            Button(action: {resetView()}){
                Text("clear all")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(.green)
            }
            
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
}

struct GoHomeButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var currentStep: Int
    

    func resetView(){
        currentStep = 1

    }
    var body: some View {

            VStack {
//                NavigationLink(
//                    destination:
//                        HomeView(),
//                    label: {
//                        Text("DONE")
//
//                    }).transition(.move(edge: .bottom))
                
                Button(action: {resetView()}){
                    Text("reset")
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(Color.green)
                .foregroundColor(.green)
                .clipped()
                .padding(10)
            }
        }


}
