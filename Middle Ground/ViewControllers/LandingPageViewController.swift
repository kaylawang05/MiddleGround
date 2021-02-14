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
    private let titleLabel: UILabel = {
        let tl = UILabel()
        tl.text = "Welcome to the Middle Ground!"
        tl.font = MGAppearance.Fonts.mainTitle
        tl.textColor = MGAppearance.Colors.color
        tl.textAlignment = .center
        tl.numberOfLines = 2
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.lineBreakMode = .byWordWrapping
        return tl
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        titleLabel.constrain(to: self.view, topInset: 102, centerXInset: 0)
        titleLabel.constrain(width: 274, height: 132)

    }

    
    
}

