//
//  Images.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 25.11.22.
//

import Foundation
import UIKit

enum ImageAsset : String {
    case Cloudy = "cloudy"
    case SomeValue = "some enum value"
    case Snowy = "snowy"
}

extension ImageAsset {
  var image : UIImage {
    return UIImage(named: self.rawValue)!
  }
}

extension UIImage {
    convenience init(asset: ImageAsset.RawValue) {
    self.init(named: asset)!
  }
}
