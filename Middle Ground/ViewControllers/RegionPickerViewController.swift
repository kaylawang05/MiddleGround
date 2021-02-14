//
//  RegionPickerViewController.swift
//  Middle Ground
//
//  Created by Kayla Wang on 2/13/21.
//

import Foundation
import UIKit

class RegionPickerViewController: UIViewController, UIPickerViewDelegate {
    
    public let regionPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
//        regionPicker.delegate = self
        
        self.view.addSubview(regionPicker)
        regionPicker.constrain(to: self.view, centerXInset: 0, centerYInset: 0)
    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        regionPicker.text = regions[row]
//    }
}
