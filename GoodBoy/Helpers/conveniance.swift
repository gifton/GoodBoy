//
//  conveniance.swift
//  Thoughts
//
//  Created by Dev on 7/2/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func getDate() -> TimeModal {
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        let output = TimeModal(day: day, month: month, year: year)
        return output
    }
}

extension UIButton {
    func disableButton(_ button: UIButton) {
        button.layer.opacity = 0.4
        button.isEnabled = false
    }
}

