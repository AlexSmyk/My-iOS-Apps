//
//  Colors.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 23.11.22.
//

import Foundation
import UIKit

public enum ColorConstants {
    static let backgroundTableColor = UIColor(hexString: "#3C4E65").withAlphaComponent(0.6)
    static let separatorColor = UIColor(hexString: "#6E7887")
    static let dailyTableCellBackgroundColor = UIColor(white: 1, alpha: 0.0)
    static let timeForecastTableViewCellBackgroundColor = UIColor(white: 1, alpha: 0.0)
    static let collectionViewBackgroundColor = UIColor(white: 1, alpha: 0.0)
    static let scrollViewBackgroundColor = UIColor(white: 1, alpha: 0.0)
    static let timeForecastCollectionViewCellBackgroundColor = UIColor(white: 1, alpha: 0.0)
    static let cityTempLabelTextColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
    static let cityNameLabelTextColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
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
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
