//
//  ViewController.swift
//  Middle Ground
//
//  Created by Kayla Wang on 2/13/21.
//

import UIKit
import AVFoundation
import AVKit

class LandingPageViewController: UIViewController {
    private let playButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200));
    
//    private let title = UILabel()
//    private let 
    
//    @objc func playVideo(_ sender: UIButton) {
//        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8") else {
//            return
//        }
//        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
//        let player = AVPlayer(url: url)
//
//        // Create a new AVPlayerViewController and pass it a reference to the player.
//        let controller = AVPlayerViewController()
//        controller.player = player
//
//        // Modally present the player and call the player's play() method when complete.
//        present(controller, animated: true) {
//            player.play()
//        }
//    }
 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController!.pushViewController(CreateProfileViewController(), animated: true)
        
//        self.present(CreateProfileViewController(), animated: true, completion: nil)
        
        // Do any additional setup after loading the view.
    }

    
    
}

