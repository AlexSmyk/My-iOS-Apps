//
//  TimeForecastCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 21.11.22.
//

import UIKit

class TimeForecastCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "TimeForecastCollectionViewCell"
    
    let timeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        label.font = UIFont(name: "Inter-Medium", size: 14)
        label.textColor = .white
        return label
    }()
    
    let iconImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let temperatureLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(timeLabel)
        addSubview(iconImage)
        addSubview(temperatureLabel)
        
        setParametrsAndConstraintsActivate()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: WeatherPerDay, index: Int) {
        
        let time = data.timestamp
        
        if index == 0 {
            let todayDayOfTheWeek = "Сейчас"
            timeLabel.text = todayDayOfTheWeek
        } else {
            timeLabel.text = time
        }
        
        iconImage.image = UIImage(asset: data.weatherType)
        temperatureLabel.text = data.temperature + (data.sunset ?? false ? "" : "°")
    }
    
    func setParametrsAndConstraintsActivate() {
        backgroundColor = ColorConstants.timeForecastCollectionViewCellBackgroundColor
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: SizesConstants.collectionViewCellTimeLabelTopAnchor),
                iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                iconImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: SizesConstants.collectionViewCellIconImageTopAnchor),
                iconImage.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: -SizesConstants.collectionViewCellIconImageBottomAnchor),
                temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                temperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -SizesConstants.collectionViewCellTemperatureLabelBottomAnchor)
            ]
        )
    }
}
