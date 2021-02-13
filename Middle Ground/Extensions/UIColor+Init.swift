//
//  UIColor+Init.swift
//  Middle Ground
//
//  Created by alden lamp on 2/13/21.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String = "#000000") {
        var str = ""
        if hex.count == 7 {
            guard String(hex.prefix(1)) == "#" else {
                self.init(red: 0, green: 0, blue: 0, alpha: 1)
                return
            }
            str = String(hex.suffix(6))
        }else{
            str = hex
        }
        guard str.count == 6 else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        
        let start = str.index(str.startIndex, offsetBy: 0)
        let mid1 = str.index(str.startIndex, offsetBy: 2)
        let mid2 = str.index(str.startIndex, offsetBy: 4)
        let end = str.index(str.startIndex, offsetBy: 6)

        let rStr = String(str[start..<mid1])
        let gStr = String(str[mid1..<mid2])
        let bStr = String(str[mid2..<end])
        
        guard let red = UInt(rStr, radix: 16), let green = UInt(gStr, radix: 16), let blue = UInt(bStr, radix: 16) else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1)
    }
    
    
}
