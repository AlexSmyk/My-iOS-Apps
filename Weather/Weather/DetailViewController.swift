//
//  DetailViewController.swift
//  Weather
//
//  Created by Алекс Смык on 31.07.22.
//

import UIKit
import SwiftSVG

class DetailViewController: UIViewController {

    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var cityView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempCityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshLabels()
    }
    
    func refreshLabels() {
        nameCityLabel.text = weatherModel?.name
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.conditionCode).svg")
        
        let weatherImage = UIView(SVGURL: url!) {(image) in
            image.resizeToFit(self.cityView.bounds)
            
        }
        
        self.cityView.addSubview(weatherImage)
        
        conditionLabel.text = weatherModel?.conditionString
        tempCityLabel.text = weatherModel!.temperatureString + " °C"
        pressureLabel.text = "\((weatherModel?.pressureMM)!)"
        windSpeedLabel.text = "\((weatherModel?.windSpeed)!)"
        minTempLabel.text = "\((weatherModel?.tempMin)!)"
        maxTempLabel.text = "\((weatherModel?.tempMax)!)"
    }

}
