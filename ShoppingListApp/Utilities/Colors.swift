// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  Colors.swift


import Foundation
import SwiftUI

extension Color {
    static let darkGray = Color(hex: "#3f4143")
    static let purple = Color(hex: "#6356c9")
    static let darkerGray = Color(hex: "#1a1a1d")
    static let darkGreen = Color(hex: "#2c6a4a")
    static let lightGray = Color(hex: "#c9c9c9")
    static let lightBlue = Color(hex: "#82c4f4")
    static let lightPurple = Color(hex: "#c1bbe6")
    static let darkerWhite = Color(hex: "#dddddd")
    static let gray = Color(hex: "#a2a2a2")
    static let black = Color(hex: "#000000")
    static let white = Color(hex: "#ffffff")
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (0, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Font {
    static let titleFont = Font.system(size: 18, weight: .bold, design: .default)
    static let bodyFont = Font.system(size: 14, weight: .regular, design: .default)
    static let buttonFont = Font.system(size: 12, weight: .regular, design: .default)
    static let buttonTextFont = Font.system(size: 16, weight: .medium, design: .default)
}
