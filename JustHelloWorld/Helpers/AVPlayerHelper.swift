//
//  AVPlayerHelper.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 11.02.2022.
//

import SwiftUI
import AVKit


struct AvPlayerControllerRepresented: UIViewControllerRepresentable {
    var player : AVPlayer

    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.videoGravity = .resizeAspectFill
        controller.showsPlaybackControls = false
        return controller
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: AvPlayerControllerRepresented

        init(_ parent: AvPlayerControllerRepresented) {
            self.parent = parent
        }
    }
}
