//
//  GifController.swift
//  Giphy
//
//  Created by igor mekkers on 28.04.2022.
//

import SwiftUI
import GiphyUISDK


struct GIFController : UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return GIFController.Coordinator(parent: self)
    }
    
    @Binding var url : String
    @Binding var present : Bool
    
    func makeUIViewController(context: Context) -> GiphyViewController {
        
        Giphy.configure(apiKey: "5NrDCI2Ziif1lOYIGHWPTq0J6Khih5V9")
        let controller = GiphyViewController()
        
        controller.mediaTypeConfig = [.emoji,.gifs,.stickers,.text]
        controller.delegate = context.coordinator
        
        // Full Screen
        GiphyViewController.trayHeightMultiplier = 1.05
        controller.theme = GPHTheme(type: .light)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: GiphyViewController, context: Context) {
        
    }
    
    class Coordinator : NSObject,GiphyDelegate{
        
        var parent : GIFController
        
        init(parent: GIFController) {
            self.parent = parent
        }
        func didDismiss(controller: GiphyViewController?) {
            
        }
        
        func didSelectMedia(giphyViewController: GiphyViewController, media: GPHMedia) {
            
            // Retreving url
            let url = media.url(rendition: .fixedWidth, fileType: .gif)
            parent.url = url ?? ""
            parent.present.toggle()
            
        }
    }
}
