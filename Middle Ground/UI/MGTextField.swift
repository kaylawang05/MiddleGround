//
//  MGTextField.swift
//  Middle Ground
//
//  Created by alden lamp on 2/13/21.
//

import Foundation
import UIKit

class MGTextField: UITextField {
    
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.constrain(width: CGFloat(MGAppearance.textFieldLength), height: CGFloat(MGAppearance.textFieldHeight))
        self.layer.cornerRadius = CGFloat(MGAppearance.textFieldHeight * 1/2)
        self.setPlaceHolder(with: placeholder)
        self.layer.borderWidth = 1
        self.layer.borderColor = MGAppearance.Colors.color.cgColor
        self.font = MGAppearance.Fonts.textField
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setPlaceHolder(with text: String = "Location?", andFont font: UIFont = MGAppearance.Fonts.textField!, andColor color: UIColor = MGAppearance.Colors.color) {
        
        let attributes = [NSAttributedString.Key.foregroundColor: color,
                          NSAttributedString.Key.font: font]
        
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
    }
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
}
