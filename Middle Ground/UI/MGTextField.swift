//
//  MGTextField.swift
//  Middle Ground
//
//  Created by alden lamp on 2/13/21.
//

import Foundation
import UIKit

class MGTextField: UITextField {
    
    
    init() {
        super.init(frame: .zero)
//        self.backgroundColor = MGAppearance.Color.lightGrey
        self.layer.cornerRadius = 20 //should be 1/2 * height
        
//        self.font = MGAppearance.Font.contentTitle
        self.setPlaceHolder()
        
//        self.tintColor = UIColor.black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceHolder(with text: String = "Location?", andFont font: UIFont = Appearance.Font.contentTitle, andColor color: UIColor = Appearance.Color.darkGrey) {
        
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
