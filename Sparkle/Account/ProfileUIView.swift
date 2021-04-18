//
//  ProfileUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI
import Firebase

struct ProfileUIView: View {
    //@EnvironmentObject var settings: SettingsObject
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var modelData: User
    @State var username = ""
    
    @FetchRequest(entity: Settings.entity(), sortDescriptors: []) var settings: FetchedResults<Settings>
    
    func getUserInfo() {
        if modelData.name.isEmpty{
            let fbhandler = Fbhandler(modelData: modelData)
            fbhandler.getUserInfo()
        }
    }
    
    func signOut(){
        let auth = Auth.auth()
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        //appData.name = ""
        modelData.signout()
    }
    var body: some View {
        
        NavigationView {
            VStack {
                
                CircleImageView(iconName: "client-a").frame(width: 140, height: 140)
                    .overlay(Circle().stroke(Theme.init().darkGreen, lineWidth: 5))
                    .padding(.bottom, 60)
                    
//                Image(systemName: "pencil.tip")
//                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Form {
//                    Section(header: Text("PROFILE")) {
//                        TextField("Username", text: $username)
//                    }
                    
                    
                    NavigationLink(destination: AccountView().environmentObject(modelData),
                            label: {
                                Text("account")
                                   
                            }).padding(.bottom)
                        
                
                    NavigationLink(destination: ChangePasswordView().environmentObject(modelData),
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
                .navigationBarTitle("")
                    .navigationBarItems(leading:
                            Button(action: {
                               // print("SF Symbol button pressed...")
                            }) {
                                //Image(systemName: "calendar.circle").imageScale(.large)
                            },
                        trailing:
                            Button(action:  {
                               signOut()
                            }) {
                                HStack {
                                    Text("Sign Out")
                                
                                }
                            }
                    )

                
            
            
//                Section(header: Text("ABOUT")) {
//                    HStack {
//                        Text("Version")
//                        Spacer()
//                        Text("2.2.1")
//                    }
//                }
            }.onAppear(){
                getUserInfo()
                if settings.isEmpty{
                    let newSetting  = Settings(context: self.context)
                    newSetting.payment = "Paypal"
                    newSetting.location = true
                    newSetting.promo = true
                    newSetting.notification = true
                }
               
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .foregroundColor(Theme.init().darkGreen)
       
    }
}

struct ProfileUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUIView()
    }
}
