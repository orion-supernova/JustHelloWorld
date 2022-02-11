//
//  Extensions.swift
//  JustHelloWorld
//
//  Created by Murat Can KOÇ on 7.02.2022.
//

import Foundation
import SwiftUI

// MARK: - Color
extension Color {
    static var random: Color {
        return Color.init(red: .random(in: 1...255)/255, green: .random(in: 1...255)/255, blue: .random(in: 1...255)/255)
    }
    static var matrixGreen: Color {
        Color.init(hexString: "00ff2b")
    }

    static var blackAndWhiteRandom: Color {
        let randomInt: Int = .random(in: 0...28)
        return BlackAndWhiteColors.colorArray[randomInt]
    }

    init(hexString: String) {
        var hex = hexString
        //Remove "#" if exists
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[start...])
        }
        hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, opacity: CGFloat(a) / 255)
    }
}

// MARK: - View
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    func getSmallDeviceWidth() -> CGFloat {
        return 320
    }
    func getDeviceType() -> DeviceType? {
        if getRect().width == 320 {
            return .smallest
        } else {
            return .normal
        }
    }
}
enum DeviceType {
    case smallest
    case normal
    case big
}

// MARK: - Text
extension Text {
    static var random: Text {
        let randomInt: Int = .random(in: 0...107)
        return Text.init(HelloWorldText.textArray[randomInt])
    }

    func colorChange(for givenText: NSString,into color: UIColor, from locationNumber: Int, to length: Int) -> NSMutableAttributedString{
        let myString:NSString = givenText
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: locationNumber,length: length))
        return myMutableString
    }
}
// MARK: - UIApplication
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
