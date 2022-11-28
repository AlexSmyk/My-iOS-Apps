//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Алекс Смык on 20.11.22.
//

import UIKit

class WeatherViewController: UIViewController, WeatherViewDelegate, WeatherViewInput {
    
    var mainView = WeatherView()
    var output: WeatherViewOutput!
    
    override func loadView() {
        view = mainView
    }
// функция setGradientBackground() устанавливает градиент на картинку, и данная функция закомментирована,
// тк у меня есть вопрос по данному светло-голубому градиенту: внешне в макете данный
// градиент серый и общий фон темно-серый, а по данным из макета он устанавливается как светло-голубой
    override func viewWillAppear(_ animated: Bool) {
//        setGradientBackground()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpeg")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
        output.getWeatherData()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }
    
    //MARK: - Input
    
    func showDailyData(_ data: WeatherData) {
        
        mainView.cellDailyData = data.forecast
        mainView.cellData = data.weatherPerDay
        mainView.weatherData = data
        mainView.cityTempLabel.text = data.temperature
        mainView.cityNameLabel.text = data.city.localized
        
    }
//градиент по данным из макета:
    func setGradientBackground() {

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [
          UIColor(red: 0.627, green: 0.866, blue: 1, alpha: 0.75).cgColor,
          UIColor(red: 0.36, green: 0.761, blue: 0.988, alpha: 0.75).cgColor,
          UIColor(red: 0.778, green: 0.904, blue: 0.975, alpha: 1).cgColor
        ]

        gradientLayer.locations = [0.13, 0.32, 0.65]
        
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0.01, b: -1.08, c: 2.48, d: 0, tx: -0.7, ty: 1.02))
        gradientLayer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        gradientLayer.position = view.center
        self.view.layer.insertSublayer(gradientLayer, at: 0)

        
        let image1 = UIImage(named: "background.jpeg")!.cgImage!
        let layer1 = CALayer()
        layer1.contents = image1
        layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.45, b: 0, c: 0, d: 1, tx: -0.22, ty: 0))
        layer1.bounds = view.bounds
        layer1.position = view.center
        self.view.layer.insertSublayer(layer1, at: 0)
    }
}
//truncated view of localization
extension String {
    var localized: String {
        if self == "Minsk" {
            return "Минск"
        } else {
            return self
        }
    }
}

