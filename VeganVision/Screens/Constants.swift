//
//  Constants.swift
//  VeganVision
//
//  Created by Ben Gabay on 11/19/22.
//

import Foundation
import UIKit
import SwiftUI

struct AppFont {
    static var lightFont: Font {
        guard let font = UIFont(name: "Poppins-Light", size: 32) else {
            fatalError("Could not resolve font")
        }
        return Font(font)
    }
    
    static var mediumFont: Font {
        guard let font = UIFont(name: "Poppins-Medium", size: 32) else {
            fatalError("Could not resolve font")
        }
        return Font(font)
    }
    
    static var semiBoldFont: Font {
        guard let font = UIFont(name: "Poppins-SemiBold", size: UIFont.labelFontSize) else {
            fatalError("Could not resolve font")
        }
        return Font(font)
    }
    
    static var boldFont: Font {
        guard let font = UIFont(name: "Poppins-Bold", size: UIFont.labelFontSize) else {
            fatalError("Could not resolve font")
        }
        return Font(font)
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
