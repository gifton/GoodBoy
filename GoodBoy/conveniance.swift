//
//  conveniance.swift
//  Thoughts
//
//  Created by Dev on 7/2/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

//extension UIView {
//    func getDate() -> TimeModal {
//        let date = Date()
//        let calendar = Calendar.current
//        let month = calendar.component(.month, from: date)
//        let day = calendar.component(.day, from: date)
//        let year = calendar.component(.year, from: date)
//        let output = TimeModal(day: day, month: month, year: year)
//        return output
//    }
//}

extension UIButton {
    func disableButton(_ button: UIButton) {
        button.layer.opacity = 0.4
        button.isEnabled = false
    }
}

class TextFieldWithImage: UITextField {
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var textRec = super.placeholderRect(forBounds: bounds)
        textRec.origin.x += 10
        return textRec
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var textRec = super.editingRect(forBounds: bounds)
        textRec.origin.x += 10
        return textRec
    }
    var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    var leftPadding: CGFloat = 5
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: UIColor.gbWhite.cgColor])
    }
}

