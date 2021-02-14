//
//  RateViewController.swift
//  Middle Ground
//
//  Created by Kayla Wang on 2/14/21.
//

import Foundation
import UIKit

class RateViewController: UIViewController {
    
    private let videoPage = BeforeVideoViewController()
    
    private let rateExplain: UILabel = {
        let re = UILabel()
        re.text = "Rate your experience:"
        re.font = MGAppearance.Fonts.heading
        re.textColor = MGAppearance.Colors.color
        re.textAlignment = .center
        return re
    }()
    private let rateSlider: UISlider = {
        let rs = UISlider()
        rs.minimumValue = 1
        rs.maximumValue = 5
        rs.isContinuous = false
        rs.tintColor = MGAppearance.Colors.color
        rs.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        return rs
    }()
    private let oneLabel: UILabel = {
        let ol = UILabel()
        ol.text = "1"
        ol.font = MGAppearance.Fonts.heading
        ol.textColor = MGAppearance.Colors.color
        ol.textAlignment = .center
        return ol
    } ()
    private let fiveLabel: UILabel = {
        let ol = UILabel()
        ol.text = "5"
        ol.font = MGAppearance.Fonts.heading
        ol.textColor = MGAppearance.Colors.color
        ol.textAlignment = .center
        return ol
    } ()
    
    private let inTouch: UILabel = {
        let it = UILabel()
        it.text = "Want to stay in touch? Your contact information will be exchanged if you both select yes."
        it.numberOfLines = 4
        it.font = UIFont(name: "Rockwell", size: 20)
        it.textColor = MGAppearance.Colors.color
        it.textAlignment = .center
        return it
    }()
    
    private let yesButton: UIButton = {
        let yb = UIButton()
        yb.setTitle("Yes", for: .normal)
        yb.addTarget(self, action: #selector(yesNo), for: .touchUpInside)
        yb.setTitleColor(MGAppearance.Colors.color, for: .normal)
        yb.layer.borderWidth = 1
        yb.layer.borderColor = MGAppearance.Colors.color.cgColor
        yb.layer.cornerRadius = 16
        return yb
    }()
    
    private let noButton: UIButton = {
        let yb = UIButton()
        yb.setTitle("No", for: .normal)
        yb.addTarget(self, action: #selector(yesNo), for: .touchUpInside)
        yb.setTitleColor(MGAppearance.Colors.color, for: .normal)
        yb.layer.borderWidth = 1
        yb.layer.borderColor = MGAppearance.Colors.color.cgColor
        yb.layer.cornerRadius = 16
        return yb
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(rateExplain)
        rateExplain.constrain(width: 290, height: 30)
        rateExplain.constrain(to: self.view, topInset: 300, centerXInset: 0)
        
        self.view.addSubview(rateSlider)
        rateSlider.constrain(width: 300, height: 15)
        rateSlider.constrain(against: rateExplain, topInset: 20)
        rateSlider.constrain(to: self.view, centerXInset: 0)
        
        self.view.addSubview(oneLabel)
        oneLabel.constrain(width: 30, height: 30)
        oneLabel.constrain(against: rateSlider, topInset: 10)
        oneLabel.constrain(to: rateSlider, leadingInset: 0)
        
        self.view.addSubview(fiveLabel)
        fiveLabel.constrain(width: 30, height: 30)
        fiveLabel.constrain(against: rateSlider, topInset: 10)
        fiveLabel.constrain(to: rateSlider, trailingInset: 0)
        
        self.view.addSubview(inTouch)
        inTouch.constrain(width: 300, height: 107)
        inTouch.constrain(against: rateSlider, topInset: 60)
        inTouch.constrain(to: self.view, centerXInset: 0)
        
        self.view.addSubview(yesButton)
        yesButton.constrain(width: 117, height: 36)
        yesButton.constrain(to: self.view, leadingInset: 50)
        yesButton.constrain(against: inTouch, topInset: 30)
        
        self.view.addSubview(noButton)
        noButton.constrain(width: 117, height: 36)
        noButton.constrain(to: self.view, trailingInset: -50)
        noButton.constrain(against: inTouch, topInset: 30)
        
    }
    @objc func valueChanged(_ slider: UISlider) {
        slider.value = round(slider.value)
    }
    @objc func yesNo() {
        self.navigationController?.pushViewController(videoPage, animated: false)
    }
}
