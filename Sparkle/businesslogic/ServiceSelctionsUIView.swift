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
                                Image("clothing")
                                    .resizable()
                                    .padding(10)
                                    .frame(width: 100, height: 100, alignment: .topLeading)

                                   // Text("service 1")
                            }})
                   
     
                    Image("flooring")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    
                    Image("refrigerator")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                }
                
                HStack {
                    Image("storage")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    Image("washingmachine")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                    Image("waxing")
                        .resizable()
                        .padding(10)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                }
              Text("Total time: 4")
            }
    }
}

struct ServiceSelctionsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceSelctionsUIView()
    }
}
