//
//  VideoViewController.swift
//  Middle Ground
//
//  Created by Kayla Wang on 2/14/21.
//

import Foundation
import UIKit

class VideoView: UIView {
    
//    private let videoBefore = BeforeVideoViewController()
    
    private let ratePage = RateViewController()
    
    private var muteClicked = false
    private let muteButton: UIButton = {
        let mb = UIButton()
        mb.backgroundColor = .white
        mb.layer.cornerRadius = 35
        if let image = UIImage(named: "mute icon") {
            mb.setImage(image, for: .normal)
        }
        mb.addTarget(self, action: #selector(clickMute), for: .touchUpInside)
        return mb
    } ()
    
    private let endButton: UIButton = {
        let eb = UIButton()
        eb.backgroundColor = .red
        eb.layer.cornerRadius = 35
        eb.setTitle("End", for: .normal)
        eb.setTitleColor(.white, for: .normal)
        eb.addTarget(self, action: #selector(clickEnd), for: .touchUpInside)
        return eb
    } ()
    
    init() {
        super.init(frame: .zero)
        self.constrain(height: 70)
        self.backgroundColor = MGAppearance.Colors.color
        
        self.addSubview(muteButton)
        muteButton.constrain(width: 70, height: 70)
        muteButton.constrain(to: self, leadingInset: 55, centerYInset: 0)
        
        self.addSubview(endButton)
        endButton.constrain(width: 140, height: 70)
        endButton.constrain(to: self, trailingInset: -45, centerYInset: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let videoImageView = UIImageView()
    @objc func clickMute() {
        if (muteClicked == false) {
            muteButton.backgroundColor = .red
            muteClicked = true
        } else {
            muteButton.backgroundColor = .white
            muteClicked = false
        }
        
    }
    @objc func clickEnd() {
        
    }
}
