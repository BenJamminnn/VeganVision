//
//  Constants.swift
//  VeganVision
//
//  Created by Ben Gabay on 11/19/22.
//

import Foundation
import UIKit
import SwiftUI

enum AppFont {
    case lightFont(size: CGFloat)
    case mediumFont(size: CGFloat)
    case semiBoldFont(size: CGFloat)
    case boldFont(size: CGFloat)
    
    var font: Font {
        switch self {
        case .lightFont(let size):
            guard let font = UIFont(name: "Poppins-Light", size: size) else {
                fatalError("Could not resolve font")
            }
            return Font(font)
        case .mediumFont(let size):
            guard let font = UIFont(name: "Poppins-Medium", size: size) else {
                fatalError("Could not resolve font")
            }
            return Font(font)
        case .semiBoldFont(let size):
            guard let font = UIFont(name: "Poppins-SemiBold", size: size) else {
                fatalError("Could not resolve font")
            }
            return Font(font)
        case .boldFont(let size):
            guard let font = UIFont(name: "Poppins-Bold", size: size) else {
                fatalError("Could not resolve font")
            }
            return Font(font)
        }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

// Color

let red50 = UIColor(rgb: 0xFFEBEE)
let red100 = UIColor(rgb: 0xFFCDD2)
let red200 = UIColor(rgb: 0xEF9A9A)
let red300 = UIColor(rgb: 0xE57373)
let red400 = UIColor(rgb: 0xEF5350)
let red500 = UIColor(rgb: 0xF44336)
let red600 = UIColor(rgb: 0xE53935)
let red700 = UIColor(rgb: 0xD32F2F)
let red800 = UIColor(rgb: 0xC62828)

let green50 = UIColor(rgb: 0xE8F5E9)
let green100 = UIColor(rgb: 0xC8E6C9)
let green200 = UIColor(rgb: 0xA5D6A7)
let green300 = UIColor(rgb: 0x81C784)
let green400 = UIColor(rgb: 0x66BB6A)
let green500 = UIColor(rgb: 0x4CAF50)
let green600 = UIColor(rgb: 0x43A047)
let green700 = UIColor(rgb: 0x388E3C)
let green800 = UIColor(rgb: 0x388E3C)
let green900 = UIColor(rgb: 0x1B5E20)
