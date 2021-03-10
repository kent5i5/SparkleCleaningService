//
//  ProfileUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

struct ProfileUIView: View {
    @EnvironmentObject var settings: SettingsObject
    @State var username = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image(systemName: "pencil.tip")
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Form {
//                    Section(header: Text("PROFILE")) {
//                        TextField("Username", text: $username)
//                    }
                    
                    
                    NavigationLink(destination: AccountView(),
                            label: {
                                Text("account")
                                   
                            }).padding(.bottom)
                        
                
                    NavigationLink(destination: ChangePasswordView(),
                            label: {
                                Text("Change password")
                                   
                            }).padding(.bottom)
            
                    NavigationLink(destination: PaymentView(),
                            label: {
                                Text("Payment")
                                   
                            }).padding(.bottom)
                        
                    
                    NavigationLink(destination: LocationOptionView(),
                            label: {
                                Text("Location")
                                   
                            }).padding(.bottom)
                        
                    NavigationLink(destination: PromoView(),
                            label: {
                                Text("Promo")
                                   
                            }).padding(.bottom)

                    NavigationLink(destination: NotificationOptionView(),
                            label: {
                                Text("Notification")

                            }).padding(.bottom)
                        
//                        Section(header: Text("Notifications settings")) {
//                                            Toggle(isOn: $settings.isNotificationEnabled) {
//                                                Text("Notification:")
//                                            }
//                                        }
// 
                    
                    NavigationLink(destination: SupportView(),label: {
                        Text("Support")
                           
                    }).padding(.bottom)
                }
                .navigationBarTitle("Settings")
                    .navigationBarItems(leading:
                            Button(action: {
                                print("SF Symbol button pressed...")
                            }) {
                                Image(systemName: "calendar.circle").imageScale(.large)
                            },
                        trailing:
                            Button(action: {
                                print("Edit button pressed...")
                            }) {
                                Text("Edit")
                            }
                    )

                
            
            
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("2.2.1")
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            
       
    }
}

struct ProfileUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUIView()
    }
}
