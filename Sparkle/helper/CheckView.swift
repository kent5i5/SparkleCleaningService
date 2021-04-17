
import SwiftUI

struct CheckView: View {
    @Binding var iconItem: [Icon]
    @Binding var totalhours:Int
    var numItem: Int
//    @State var isChecked:Bool =  false
//    var icon: String
//   var title:String
   func toggle(){
        if iconItem[numItem].isSelected {
            totalhours = totalhours - 1
        } else {
            totalhours = totalhours + 1
        }
        
        iconItem[numItem].isSelected.toggle()
   }
   var body: some View {
       Button(action: toggle){
        VStack {
            Image( iconItem[numItem].name)
                .resizable()
                .padding(10)
                .frame(width: 100, height: 100, alignment: .topLeading)
                .foregroundColor(iconItem[numItem].isSelected ? .green : .black)
                .overlay(iconItem[numItem].isSelected ? Image("selectworker").scaleEffect(CGSize(width: 1, height: 1)) : nil)
//                .overlay(RoundedRectangle(cornerRadius: 15)
//                            .stroke(lineWidth: 2)
//                            .foregroundColor(iconItem[numItem].isSelected   ? Theme.init().darkGreen : .white))
            HStack{
                   Text(iconItem[numItem].type)
                   Image(systemName: iconItem[numItem].isSelected  ? "checkmark.square": "square")
                  
            }.foregroundColor(iconItem[numItem].isSelected  ? Color(red: 36/255, green: 106/255, blue: 93/255, opacity: 1) : Color(red: 36/255, green: 106/255, blue: 93/255, opacity: 1))
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
