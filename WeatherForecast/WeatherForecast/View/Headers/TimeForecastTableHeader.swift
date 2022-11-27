//
//  TimeForecastTableHeader.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 22.11.22.
//

import UIKit

class TimeForecastTableHeader: UITableViewHeaderFooterView  {
    static let identifier = "TimeForecastTableHeader"
    
    let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.227329582, green: 0.2323184013, blue: 0.2370472848, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 14)
        label.textColor = .white
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(weatherDescriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = ColorConstants.timeForecastTableViewCellBackgroundColor
        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                weatherDescriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: SizesConstants.weatherDescriptionLabelCenterYAnchor),
                weatherDescriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: SizesConstants.weatherDescriptionLabelLeftAnchor),
                weatherDescriptionLabel.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -SizesConstants.weatherDescriptionLabelRightAnchor)
            ])
        
    }
    
}
