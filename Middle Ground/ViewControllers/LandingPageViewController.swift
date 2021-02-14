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
    private let logoImageView = UIImageView()
    private let slogan: UILabel = {
        let s = UILabel()
        s.text = "Meet   Discuss   Learn"
        s.font = UIFont(name: "Rockwell", size: 25)
        s.textColor = MGAppearance.Colors.color
        s.textAlignment = .center
        return s
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        titleLabel.constrain(to: self.view, topInset: 102, centerXInset: 0)
        titleLabel.constrain(width: 274, height: 132)

        self.view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.constrain(to: self.view, centerXInset: 0, centerYInset: 0)
        logoImageView.constrain(width: 367, height: 396)
        //logoImageView.backgroundColor = .blue
        
        logoImageView.addSubview(slogan)
        slogan.constrain(width: 376, height: 30)
        slogan.constrain(to: logoImageView, bottomInset: 0)
    }

    
    
}

