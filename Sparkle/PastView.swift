//
//  PastView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/24/21.
//

import SwiftUI

struct PastView: View {
    var favorite: Favorite
    var body: some View {
        VStack {
            HStack {
                Text("JobID: ").frame( alignment: .leading).font(.title3).foregroundColor(.green)
                Text(favorite.id.uuidString).frame( alignment: .leading).font(.caption)
            }
            Divider()
            HStack {
                Text("Title: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                Text( favorite.name).font(.body)
                Divider()
                Text("Duration: " ).frame( alignment: .leading).font(.body).foregroundColor(.green)
                Text(String(favorite.duration)).font(.body)
            }

        }.padding()
        .border(Color.green)
    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView(favorite: Favorite(name: "", duration: 0.0))
    }
}
