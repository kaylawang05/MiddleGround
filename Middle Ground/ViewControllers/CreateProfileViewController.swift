//
//  CreateProfileViewController.swift
//  Middle Ground
//
//  Created by alden lamp on 2/13/21.
//

import Foundation
import UIKit

class CreateProfileViewController: UIViewController {
    
    
    let textField: UITextField = {
        let field = UITextField()
        field.constrain(height: 50)
        field.layer.cornerRadius = 25
        field.layer.borderWidth = 1
        field.layer.borderColor = MGAppearance.Colors.textColor.cgColor
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(textField)
        textField.constrain(to: self.view, topInset: 100, leadingInset: 100, trailingInset: -100, centerXInset: 0)
        textField.text = "Hello World"
        textField.font = MGAppearance.Fonts.testFont
        
        
        
        
    }
    
    
}
