//
//  CreateProfileViewController.swift
//  Middle Ground
//
//  Created by alden lamp on 2/13/21.
//

import Foundation
import UIKit

class CreateProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    private let regions = ["Northeast", "Midwest", "West", "Southeast", "Southwest", "International"]
    private var name = ""
    private var age = 0
    private var pronouns = ""
    private var selectedRegion = ""
    private var economic = 0
    private var social = 0
    
    private let topView = UIView()
    private let line = UIView()
    private let bottomView = UIView()
    private let economicView = UIView()
    private let socialView = UIView()
//    private let linkView = UIView()
    
    public let videoPage = BeforeVideoViewController()
    
    private let titleLabel: UILabel = {
        let tl = UILabel()
        tl.text = "Create Profile"
        tl.font = MGAppearance.Fonts.title
        tl.textColor = MGAppearance.Colors.color
        tl.textAlignment = .center
        return tl
    }()
    private let subtitleLabel: UILabel = {
        let sl = UILabel()
        sl.text = "Enter your information below"
        sl.font = MGAppearance.Fonts.subtitle
        sl.textColor = MGAppearance.Colors.color
        sl.textAlignment = .center
        return sl
    }()
    private let nameTextField = MGTextField(placeholder: "Name")
    private let ageTextField = MGTextField(placeholder: "Age")
    private let pronounTextField = MGTextField(placeholder: "Pronouns (optional)")
    private let regionButton: UIButton = {
        let rb = UIButton()
        rb.addTarget(self, action: #selector(selectRegion), for: .touchUpInside)
        return rb
    }()
    private let politicalAffiliation: UILabel = {
        let pt = UILabel()
        pt.text = "Political Affiliation:"
        pt.font = MGAppearance.Fonts.heading
        pt.textColor = MGAppearance.Colors.color
        return pt
    }()
    private let economicSlider: UISlider = {
        let es = UISlider()
        es.minimumValue = 0
        es.maximumValue = 1
        es.isContinuous = false
        es.tintColor = MGAppearance.Colors.color
        return es
    }()
    private let leftLabel: UILabel = {
        let left = UILabel()
        left.text = "Left"
        left.font = MGAppearance.Fonts.regular
        left.textColor = MGAppearance.Colors.color
        return left
    }()
    private let rightLabel: UILabel = {
        let right = UILabel()
        right.text = "Right"
        right.font = MGAppearance.Fonts.regular
        right.textColor = MGAppearance.Colors.color
        return right
    }()
    private let socialSlider: UISlider = {
        let es = UISlider()
        es.minimumValue = 0
        es.maximumValue = 1
        es.isContinuous = false
        es.tintColor = MGAppearance.Colors.color
        return es
    }()
    private let libertarianLabel: UILabel = {
        let left = UILabel()
        left.text = "Libertarian"
        left.font = MGAppearance.Fonts.regular
        left.textColor = MGAppearance.Colors.color
        return left
    }()
    private let authoritarianLabel: UILabel = {
        let right = UILabel()
        right.text = "Authoritarian"
        right.font = MGAppearance.Fonts.regular
        right.textColor = MGAppearance.Colors.color
        return right
    }()
    private let makeProfileButton: UIButton = {
        let mpb = UIButton()
        mpb.addTarget(self, action: #selector(makeProfile), for: .touchUpInside)
        mpb.setTitle("Create Profile", for: .normal)
        mpb.layer.cornerRadius = CGFloat(MGAppearance.textFieldHeight * 1/2)
        mpb.setTitleColor(MGAppearance.Colors.color, for: .normal)
        mpb.layer.borderWidth = 1
        mpb.layer.borderColor = MGAppearance.Colors.color.cgColor
        return mpb
    }()
    
//    private let politicalSentence1: UILabel = {
//        let ps = UILabel()
//        ps.text = "Not sure? Click "
//        ps.font = MGAppearance.Fonts.textField
//        return ps
//    } ()
//    private let linkButton: UIButton = {
//        let lb = UIButton()
//        lb.addTarget(self, action: #selector(goToLink), for: .touchUpInside)
//        lb.setTitleColor(MGAppearance.Colors.color, for: .normal)
//        return lb
//    }()
//    private let politicalSentence2: UILabel = {
//        let ps2 = UILabel()
//        ps2.text = " to find out."
//        return ps2
//    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        nameTextField.delegate = self
        ageTextField.delegate = self
        pronounTextField.delegate = self
        
        self.view.addSubview(topView)
        self.view.addSubview(line)
        self.view.addSubview(bottomView)
        self.view.addSubview(economicView)
        
        topView.backgroundColor = .white
        topView.constrain(to: self.view, topInset: 0, leadingInset: 0, trailingInset: 0)
        topView.constrain(height: 217)
        
        topView.addSubview(titleLabel)
        titleLabel.constrain(height: 40)
        titleLabel.constrain(to: topView, leadingInset: 0, trailingInset: 0, centerXInset: 0, centerYInset: 0)
        
        topView.addSubview(subtitleLabel)
        subtitleLabel.constrain(height: 30)
        subtitleLabel.constrain(to: topView, leadingInset: 0, trailingInset: 0, centerXInset: 0)
        subtitleLabel.constrain(against: titleLabel, topInset: 10)
        
        line.backgroundColor = MGAppearance.Colors.color
        line.constrain(to: self.view, leadingInset: 0, trailingInset: 0)
        line.constrain(against: topView, topInset: 0)
        line.constrain(height: 1)
        
        bottomView.backgroundColor = .white
        bottomView.constrain(to: self.view, bottomInset: 0, leadingInset: 0, trailingInset: 0)
        bottomView.constrain(against: line, topInset: 0)
        
        bottomView.addSubview(nameTextField)
        nameTextField.textAlignment = .center
        nameTextField.constrain(to: bottomView, topInset: CGFloat(MGAppearance.distanceBetweenTextField), centerXInset: 0)
        
        bottomView.addSubview(ageTextField)
        ageTextField.textAlignment = .center
        ageTextField.constrain(to: self.view, centerXInset: 0)
        ageTextField.constrain(against: nameTextField, topInset: CGFloat(MGAppearance.distanceBetweenTextField))
        ageTextField.keyboardType = .numberPad
        
        bottomView.addSubview(pronounTextField)
        pronounTextField.textAlignment = .center
        pronounTextField.constrain(to: self.view, centerXInset: 0)
        pronounTextField.constrain(against: ageTextField, topInset: CGFloat(MGAppearance.distanceBetweenTextField))
        
        bottomView.addSubview(regionButton)
        regionButton.layer.borderWidth = 1
        regionButton.layer.borderColor = MGAppearance.Colors.color.cgColor
        regionButton.layer.cornerRadius = CGFloat(MGAppearance.textFieldHeight * 1/2)
        regionButton.setTitle("Select Region", for: .normal)
        regionButton.setTitleColor(MGAppearance.Colors.color, for: .normal)
        regionButton.titleLabel?.font =  MGAppearance.Fonts.regular
        regionButton.constrain(to: self.view, centerXInset: 0)
        regionButton.constrain(against: pronounTextField, topInset: CGFloat(MGAppearance.distanceBetweenTextField))
        regionButton.constrain(width: 300, height: 36)
    
        bottomView.addSubview(politicalAffiliation)
        politicalAffiliation.constrain(to: self.view, centerXInset: 0)
        politicalAffiliation.constrain(against: regionButton, topInset: CGFloat(MGAppearance.distanceBetweenTextField))
        politicalAffiliation.constrain(height: 45)
    
        bottomView.addSubview(economicView)
        economicView.constrain(against: politicalAffiliation, topInset: 0)
        economicView.constrain(to: self.view, centerXInset: 0)
        economicView.constrain(width: 300, height: 40)
        
        economicView.addSubview(economicSlider)
        economicSlider.constrain(to: economicView, bottomInset: 0, centerXInset: 0)
        economicSlider.constrain(width: 300, height: 5)
        
        economicView.addSubview(leftLabel)
        leftLabel.constrain(to: economicView, topInset: 0, leadingInset: 0)
        leftLabel.constrain(against: economicSlider, bottomInset: 10)
        
        economicView.addSubview(rightLabel)
        rightLabel.constrain(to: economicView, topInset: 0, trailingInset: 0)
        rightLabel.constrain(against: economicSlider, bottomInset: 10)
        
        bottomView.addSubview(socialView)
        socialView.constrain(against: economicView, topInset: 30)
        socialView.constrain(to: self.view, centerXInset: 0)
        socialView.constrain(width: 300, height: 30)
        
        socialView.addSubview(socialSlider)
        socialSlider.constrain(to: socialView, bottomInset: 0, centerXInset: 0)
        socialSlider.constrain(width: 300, height: 5)
        
        socialView.addSubview(libertarianLabel)
        libertarianLabel.constrain(to: socialView, topInset: 0, leadingInset: 0)
        libertarianLabel.constrain(against: socialSlider, bottomInset: 10)
        
        socialView.addSubview(authoritarianLabel)
        authoritarianLabel.constrain(to: socialView, topInset: 0, trailingInset: 0)
        authoritarianLabel.constrain(against: socialSlider, bottomInset: 10)
        
        bottomView.addSubview(makeProfileButton)
        makeProfileButton.constrain(width: CGFloat(MGAppearance.textFieldLength), height: CGFloat(MGAppearance.textFieldHeight))
        makeProfileButton.constrain(to: self.view, centerXInset: 0)
        makeProfileButton.constrain(against: socialView, topInset: 40)
//        bottomView.addSubview(linkView)
//        linkView.constrain(to: bottomView, centerXInset: 0)
//        linkView.constrain(against: politicalAffiliation, topInset: 3)
//        linkView.constrain(width: 300, height: 20)
//
//        linkView.addSubview(politicalSentence1)
//        politicalSentence1.constrain(to: linkView, topInset: 0, bottomInset: 0)
//        politicalSentence1.constrain(to: linkView, leadingInset: 0)
//        //politicalSentence1.constrain(against: linkButton, trailingInset: 0)
//
//        linkView.addSubview(linkButton)
//        linkButton.constrain(to: linkView, topInset: 0, bottomInset: 0)
//        linkButton.constrain(against: politicalSentence1, leadingInset: 0)
//        //linkButton.constrain(against: politicalSentence2, trailingInset: 0)
//
//        linkView.addSubview(politicalSentence2)
//        politicalSentence2.constrain(to: linkView, topInset: 0, bottomInset: 0)
//        politicalSentence2.constrain(against: linkButton, leadingInset: 0)
//        politicalSentence2.constrain(to: linkView, trailingInset: 0)
        
    }
    
    
    
    @objc func selectRegion() {
        let picker = RegionPickerViewController()
        picker.regionPicker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    @objc func goToLink() {
        if let url = URL(string: "www.politicalcompass.com/test") {
            UIApplication.shared.open(url)
        }
    }
    @objc func makeProfile() {
        print(nameTextField.text!)
        print(ageTextField.text!)
        print(pronounTextField.text!)
        print(selectedRegion)
        print(economicSlider.value)
        print(socialSlider.value)
        self.navigationController?.pushViewController(videoPage, animated: false)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        regionButton.setTitle(regions[row], for: .normal)
        selectedRegion = regions[row]
        return regions[row]
    }
}
/*
extension UIViewController {
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
*/


