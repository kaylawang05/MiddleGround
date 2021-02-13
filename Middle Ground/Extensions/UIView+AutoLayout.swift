//
//  UIView+AutoLayout.swift
//  MiddleGround
//
//  Created by Alden Lamp on 12/28/20.
//  Copyright © 2020 alden lamp. All rights reserved.
//

import Foundation
import UIKit

internal extension UIView {
    
    func constrain(width: CGFloat? = nil,
                    height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func constrain(against view: UIView,
                   topInset: CGFloat? = nil,
                   bottomInset: CGFloat? = nil,
                   leadingInset: CGFloat? = nil,
                   trailingInset: CGFloat? = nil){
        if let topInset = topInset {
            topAnchor.constraint(equalTo: view.bottomAnchor, constant: topInset).isActive = true
        }

        if let trailingInset = trailingInset {
            trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: trailingInset).isActive = true
        }

        if let bottomInset = bottomInset {
            bottomAnchor.constraint(equalTo: view.topAnchor, constant: bottomInset).isActive = true
        }

        if let leadingInset = leadingInset {
            leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: leadingInset).isActive = true
        }


    }
    
    func constrain(to view: UIView,
                   topInset: CGFloat? = nil,
                   bottomInset: CGFloat? = nil,
                   leadingInset: CGFloat? = nil,
                   trailingInset: CGFloat? = nil,
                   widthInset: CGFloat? = nil,
                   heightInset: CGFloat? = nil,
                   centerXInset: CGFloat? = nil,
                   centerYInset: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false

        if let topInset = topInset {
            topAnchor.constraint(equalTo: view.topAnchor, constant: topInset).isActive = true
        }

        if let trailingInset = trailingInset {
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingInset).isActive = true
        }

        if let bottomInset = bottomInset {
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomInset).isActive = true
        }

        if let leadingInset = leadingInset {
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        }

        if let widthInset = widthInset {
            widthAnchor.constraint(equalTo: view.widthAnchor, constant: widthInset).isActive = true
        }

        if let heightInset = heightInset {
            heightAnchor.constraint(equalTo: view.heightAnchor, constant: heightInset).isActive = true
        }
        
        if let centerYInset = centerYInset {
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerYInset).isActive = true
        }
        
        if let centerXInset = centerXInset {
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerXInset).isActive = true
        }
    }
}
