//
//  LoginView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/1/21.
//

import SwiftUI


struct LoginView: View {

    @State private var isPresented = false
    
    @State private var Email = ""
    @State private var Password = ""
    var body: some View {

        VStack {

            
            Image("sparkle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("Sparkle")
                .padding()
                

            VStack {
                TextField("Email/Phone", text: $Email)
                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top:8, leading: 16,
                                        bottom:8, trailing:0 ))
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.green))
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                
                
                Spacer()
                    .frame(height: 100)
                    
                TextField("Password", text: $Password)
                    .frame(width: 260, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
                    .padding(EdgeInsets(top:8, leading: 16,
                                        bottom:8, trailing:0 ))
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.green))
                   
                    .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                
                HStack {
                    Text("Forget your password?")
                        .font(.footnote)
                    Button(action:  {
                        print("close")
                    }){
                        Text("Reset Password")
                            .font(.footnote)
                            .foregroundColor(Color(red: 0, green: 0.5, blue: 0.1))
                    }
                }
            }.padding()
                
            
     

            
            Button(action:  {
                self.isPresented.toggle()
            }) {
        
                HStack {
                    Text("Google / Facebook")
                }.sheet(isPresented: $isPresented){
                    FirebaseSignInViewControllerRepresentation()
                }
            }
            

            //Spacer()
        }
        //.navigationTitle("Title")
        .navigationBarHidden(false)
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
