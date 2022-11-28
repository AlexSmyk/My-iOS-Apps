//
//  Assembly.swift
//  WeatherApp
//
//  Created by Алекс Смык on 20.11.22.
//

import Foundation
import UIKit

class Assembly {
    class func configuredModule() -> UIViewController {
        
        let view = WeatherViewController()
        let presenter = WeatherPresenter()
        let dataManager = WeatherDataManager()
        
        view.output = presenter
        presenter.view = view
        presenter.dataManager = dataManager
        
        return view
    }
    
}
