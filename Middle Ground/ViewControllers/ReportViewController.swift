//
//  ReportViewController.swift
//  Middle Ground
//
//  Created by Kayla Wang on 2/14/21.
//

import Foundation
import UIKit

class ReportViewController: UIViewController {
    
    private let reportLabel: UILabel = {
        let tl = UILabel()
        tl.text = "Tell us about the incident:"
        tl.font = MGAppearance.Fonts.heading
        tl.textColor = MGAppearance.Colors.color
        return tl
    }()
    
    private let reportTextView: UITextView = {
        let rtf = UITextView()
        rtf.layer.borderWidth = 1
        rtf.layer.borderColor = MGAppearance.Colors.color.cgColor
        return rtf
    }()
    
    private let reportButton: UIButton = {
        let rb = UIButton()
        rb.setTitle("Report", for: .normal)
        rb.setTitleColor(MGAppearance.Colors.color, for: .normal)
        rb.layer.borderColor = MGAppearance.Colors.color.cgColor
        rb.layer.borderWidth = 1
        rb.layer.cornerRadius = CGFloat(MGAppearance.textFieldHeight * 1/2)
        return rb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(reportLabel)
        self.view.addSubview(reportTextView)
        self.view.addSubview(reportButton)
        
        reportLabel.constrain(to: self.view, centerXInset: 0)
        reportLabel.constrain(against: reportTextView, bottomInset: 0)
        reportLabel.constrain(width: 300, height: 30)
        
        reportTextView.constrain(width: 300, height: 400)
        reportTextView.constrain(to: self.view, centerXInset: 0, centerYInset: 0)
        
        dismissKey()
        
        reportButton.constrain(width: CGFloat(MGAppearance.textFieldLength), height: CGFloat(MGAppearance.textFieldHeight))
        reportButton.constrain(against: reportTextView, topInset: 10)
        reportButton.constrain(to: self.view, centerXInset: 0)
        
    }
}
extension UIViewController {
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
