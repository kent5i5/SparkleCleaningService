//
//  CalenderUIView.swift
//  Sparkle
//
//  Created by ying kit ng on 1/5/21.
//

import SwiftUI

private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
struct ScrollView1<Content: View>: View {
    let axes: Axis.Set
    let showsIndicators: Bool
    let offsetChanged: (CGPoint) -> Void
    let content: Content

    init(
        axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        offsetChanged: @escaping (CGPoint) -> Void = { _ in },
        @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.offsetChanged = offsetChanged
        self.content = content()
    }
    var body: some View {
            SwiftUI.ScrollView(axes, showsIndicators: showsIndicators) {
                GeometryReader { geometry in
                    Color.clear.preference(
                        key: ScrollOffsetPreferenceKey.self,
                        value: geometry.frame(in: .named("scrollView")).origin
                    )
                }.frame(width: 0, height: 0)
                content
            }
            .coordinateSpace(name: "scrollView")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: offsetChanged)
        }
}

struct CalenderUIView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var serviceDate: ServiceRepository
    @State var selectedDate = Date()
    
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    @ObservedObject var navigate = serviceNavigator(currentView: "SelectServiceSubView",firstView: "SelectServiceSubView")
    
    func showMenu(){
        showMenuItem3.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            showMenuItem2.toggle()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            showMenuItem1.toggle()
        })
    }
    var body: some View {
       
        VStack {
            VStack(spacing:0) {
                HStack{
                        Text("Cleaing Schedule ").frame( alignment: .leading).font(.title)
                        Spacer()
                    }.padding(EdgeInsets(top:8, leading: 16,
                                     bottom:60, trailing:0 ))
            
               
                    
                DatePicker("When is the starting date?", selection: $serviceDate.startDate,in: Date()..., displayedComponents:  [.date, .hourAndMinute])
                      .datePickerStyle(GraphicalDatePickerStyle())
                    .background(Theme.init().darkGreen)
                    .accentColor(colorScheme == .dark ? Theme.init().lightGreen : Theme.init().yellow)
                    .foregroundColor(.white)
                        //.accentColor(colorScheme == .dark ? Color.secondary : Color.primary)
                    
                
               // Text("\(serviceDate.startDate)").frame( height: 20, alignment: .bottomLeading).font(.caption)
                
                
            }.offset(y: 8)
            Spacer()
            GeometryReader { geo in
                ZStack(alignment: .bottomTrailing) {
                    VStack {
                        ScrollView1(
                                    axes: [.horizontal, .vertical],
                                    showsIndicators: false,
                                    offsetChanged: { print($0)
                                        //print("geo.size.height)
                                    }
                                ){
                            ScrollViewReader { proxy in
                               
                                    LazyVStack{
                                        
                                                    ForEach(0..<6) { index in
                                                        
                                                        EventView().id(index)
                                                            .shadow(radius: 8)
                                                        Spacer()
                            
                                                    }
                                    }
                             
                                
                            }.onTapGesture {
                                print(geo)
                            }
                            
                        }
                    }.mask(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.9),Color.white.opacity(0.7), Color.white.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                   
                   
                    Rectangle().foregroundColor(.clear).frame(maxWidth: .infinity, maxHeight: .infinity)
                    NavigationLink(destination: SelectServiceUIView(navigate: navigate)) {
                        FloatingMenuUIView(showMenuItem1: false, showMenuItem2: false, showMenuItem3: false)
                            .padding()
                    }
                }
            }
        }//.navigationViewStyle(StackNavigationViewStyle())
        .foregroundColor(Theme.init().darkGreen)
       
    }
        
        //            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Cleaning Schedule")})
        //                .datePickerStyle(GraphicalDatePickerStyle())

}

struct CalenderUIView_Previews: PreviewProvider{
    static var previews: some View {
        CalenderUIView()
    }
}




