
import SwiftUI

struct CheckView: View {
    @Binding var iconItem: [Icon]
    var numItem: Int
//    @State var isChecked:Bool =  false
//    var icon: String
//   var title:String
   func toggle(){
    //isChecked = !isChecked
    iconItem[numItem].isSelected.toggle()
   }
   var body: some View {
       Button(action: toggle){
        VStack {
            Image(systemName: iconItem[numItem].name)
                .resizable()
                .padding(10)
                .frame(width: 100, height: 100, alignment: .topLeading)
                .foregroundColor(iconItem[numItem].isSelected ? .green : .black)
                .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                            .foregroundColor(iconItem[numItem].isSelected   ? .green : .white))
            HStack{
                   Text(iconItem[numItem].type)
                   Image(systemName: iconItem[numItem].isSelected  ? "checkmark.square": "square")
                  
            }.foregroundColor(iconItem[numItem].isSelected  ? .green : .black)
        }

       }

   }

}
//
//struct CheckView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        CheckView(iconItem: iconItem, isChecked: false, icon: "arrow.clockwise.icloud.fill",title: "check")
//    }
//}