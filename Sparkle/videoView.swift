//
//  videoView.swift
//  Sparkle
//
//  Created by ying kit ng on 3/8/21.
//

import SwiftUI
import AVKit


struct videoView: View {
    @Environment(\.presentationMode) var presentationMode
    private let player = AVPlayer(url:  URL(string: "https://a.com")!)
    

    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

        VStack {
            Button("Dismiss Modal") {
                       presentationMode.wrappedValue.dismiss()
            }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
            // display removte source
            if #available(iOS 14.0, *) {
                VideoPlayer(player: player){
                    VStack {
                           Text("Watermark")
                               .font(.caption)
                               .foregroundColor(.white)
                               .background(Color.black.opacity(0.7))
                               .clipShape(Capsule())
                           //Spacer()
                    }
                    //.rotationEffect(.degrees(90.0))
                    //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }.onAppear() {
                    player.play()
                    AppDelegate.orientationLock = UIInterfaceOrientationMask.landscapeLeft
                           UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                           UINavigationController.attemptRotationToDeviceOrientation()
                }.edgesIgnoringSafeArea(.all)
                .onDisappear {
                    player.pause()
                       DispatchQueue.main.async {
                           AppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
                           UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                           UINavigationController.attemptRotationToDeviceOrientation()
                       }
                }
                
                //.frame(width: .infinity, height: .infinity)
                //.rotationEffect(.degrees(90.0))

            }else {
                Text("Video URL not available!")
            }
        }
        
        //display local source
       //VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video", withExtension: "mp4")!))
    }
}

struct videoView_Previews: PreviewProvider {
    static var previews: some View {
        videoView()
    }
}



