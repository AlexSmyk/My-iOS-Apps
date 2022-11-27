//
//  DailyTableCell.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 20.11.22.
//

import Foundation
import UIKit


final class DailyTableCell: UITableViewCell {
    
    static let reuseId = "myCell"
    
    let dayLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 18)
        label.numberOfLines = 1
        return label
    }()
    
    let minTempLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 15)
        label.textAlignment = .left
        return label
    }()
    
    let maxTempLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Inter-Medium", size: 15)
        label.textAlignment = .left
        return label
    }()
    
    let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(dayLabel)
        addSubview(minTempLabel)
        addSubview(maxTempLabel)
        addSubview(iconImage)
        
        setParametrsAndConstraintsActivate()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: Forecast, index: Int) {
        
        guard let dayOfTheWeek = convertDateStringToDay(from: data.date) else { return }
        
        if index == 0 {
            let todayDayOfTheWeek = "Сегодня"
            dayLabel.text = todayDayOfTheWeek
        } else {
            dayLabel.text = dayOfTheWeek
        }

        iconImage.image = UIImage(named: "cloudy")
        minTempLabel.text = String(data.minTemperature) + "°"
        maxTempLabel.text = String(data.maxTemperature) + "°"
    }
    
    func setParametrsAndConstraintsActivate() {
        
        backgroundColor = ColorConstants.dailyTableCellBackgroundColor
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate(
            [
                iconImage.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                constant: SizesConstants.dailyTableCellIconImageLeftAnchor),
                iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                dayLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                               constant: SizesConstants.dailyTableCellDayLabelLeftAnchor),
                dayLabel.rightAnchor.constraint(greaterThanOrEqualTo: iconImage.leftAnchor,
                                                constant: -SizesConstants.dailyTableCellDayLabelRightAnchor),
                dayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                dayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: SizesConstants.dailyTableCellDayLabelWidthAnchor),
                minTempLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: SizesConstants.dailyTableCellMinTempLabelLeftAnchor),
                minTempLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                maxTempLabel.leftAnchor.constraint(lessThanOrEqualTo: minTempLabel.rightAnchor, constant: SizesConstants.dailyTableCellMaxTempLabelLeftAnchor),
                maxTempLabel.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor, constant: -SizesConstants.dailyTableCellMaxTempLabelRightAnchor),
                maxTempLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            ]
        )
    }
    
    func convertDateStringToDay(from date: String) -> String? {
        
        //convert from string to date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        guard let dateFromString = dateFormatter.date(from: date) else { return nil }
        
        //convert from date to string and extract day
        dateFormatter.dateFormat = "EEEEE"
        let dayFromString = dateFormatter.string(from: dateFromString)
        
        return dayFromString
        
        
    }
}
