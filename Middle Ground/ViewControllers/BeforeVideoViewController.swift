//
//  BeforeVideoViewController.swift
//  Middle Ground
//
//  Created by Kayla Wang on 2/14/21.
//

import Foundation
import UIKit

class BeforeVideoViewController: UIViewController {
    
    private let videoImageView = UIImageView()
    private let matchButton: UIButton = {
        let mb = UIButton()
        mb.setTitle("Match", for: .normal)
        mb.setTitleColor(.white, for: .normal)
        mb.backgroundColor = MGAppearance.Colors.color
        mb.titleLabel?.font =  MGAppearance.Fonts.heading
        mb.layer.cornerRadius = 33
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(videoImageView)
        videoImageView.constrain(to: self.view, topInset: 0, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        
        self.view.addSubview(matchButton)
        matchButton.constrain(width: 219, height: 66)
        matchButton.constrain(to: videoImageView, topInset: 677, centerXInset: 0)
    }
}
