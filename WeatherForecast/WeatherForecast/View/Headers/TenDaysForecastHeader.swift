//
//  tenDaysForecastTableHeader.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 25.11.22.
//

import Foundation
import UIKit

class TenDaysForecastTableHeader: UITableViewHeaderFooterView  {
    
    static let identifier = "tenDaysForecastTableHeader"
    
    let tenDaysForecastLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
//        label.font = Constants.postLabelFont
        label.text = "10-DAY FORECAST"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor(hexString: "#95A1B1")
        label.font = UIFont(name: "Inter-Medium", size: 14)
        return label
    }()
    
    let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "calendar")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(tenDaysForecastLabel)
        contentView.addSubview(iconImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                self.heightAnchor.constraint(lessThanOrEqualToConstant: SizesConstants.tenDaysForecastTableHeaderHeightAnchor),
                contentView.heightAnchor.constraint(lessThanOrEqualToConstant: SizesConstants.tenDaysForecastTableHeaderContentViewHeightAnchor),
            iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: SizesConstants.iconImageLeftAnchor),
            tenDaysForecastLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: SizesConstants.tenDaysForecastLabelLeftAnchor),
            tenDaysForecastLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            tenDaysForecastLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -SizesConstants.tenDaysForecastLabelBottomAnchor)
            ])
        
    }

    
}
