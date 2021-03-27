//
//  ServiceSelctionsUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/3/21.
//

import SwiftUI

struct ServiceSelctionsUIView: View {
    @State var isSelect = false
//    @State var iconName = ""
    var body: some View {
            VStack {
                HStack {
                   
                    NavigationLink(
                        destination:
                            SelectServiceUIView(),
                        label: {
                            VStack {
                                Image(systemName: "applescript")
                                    .resizable()
                                    .padding(10)
                                    .frame(width: 100, height: 100, alignment: .topLeading)

                                    Text("service 1")
                            }})
                   
     
                    Image(systemName: "arkit")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    
                    Image(systemName: "bonjour")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                }
                
                HStack {
                    Image(systemName: "swift")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    Image(systemName: "safari")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    Image(systemName: "macpro.gen1")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                }
              
            }
    }
}

struct ServiceSelctionsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceSelctionsUIView()
    }
}
