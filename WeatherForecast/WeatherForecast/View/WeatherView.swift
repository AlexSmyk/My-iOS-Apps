//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Алекс Смык on 20.11.22.
//

import Foundation
import UIKit

protocol WeatherViewDelegate: AnyObject {
}

class WeatherView: UIView, UITableViewDelegate {
    
    var delegate: WeatherViewDelegate?
    
    var weatherData: WeatherData!
    var cellDailyData: [Forecast] = []
    var cellData: [WeatherPerDay] = []
    
    lazy var cityNameLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Medium", size: 30)
//        label.font =
        label.textColor = ColorConstants.cityNameLabelTextColor
        return label
    }()
    
    lazy var cityTempLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.textColor = ColorConstants.cityTempLabelTextColor
        return label
    }()
    
    
    let timeForecastTableView = UITableView()
    let tenDaysForecastTableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        timeForecastTableView.delegate = self
        timeForecastTableView.dataSource = self
        
        tenDaysForecastTableView.delegate = self
        tenDaysForecastTableView.dataSource = self
        
        tenDaysForecastTableView.register(DailyTableCell.self, forCellReuseIdentifier: DailyTableCell.reuseId)
        tenDaysForecastTableView.register(TenDaysForecastTableHeader.self, forHeaderFooterViewReuseIdentifier: TenDaysForecastTableHeader.identifier)
        
        timeForecastTableView.register(TimeForecastTableViewCell.self, forCellReuseIdentifier: TimeForecastTableViewCell.reuseId)
        timeForecastTableView.register(TimeForecastTableHeader.self, forHeaderFooterViewReuseIdentifier: TimeForecastTableHeader.identifier)
        
        
        addSubview(cityNameLabel)
        addSubview(cityTempLabel)
        addSubview(tenDaysForecastTableView)
        addSubview(timeForecastTableView)
        
        
        setParametrsAndConstraintsActivate()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: set labels, tableviews parametrs and constraints
    
    func setParametrsAndConstraintsActivate() {
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityTempLabel.translatesAutoresizingMaskIntoConstraints = false
        tenDaysForecastTableView.translatesAutoresizingMaskIntoConstraints = false
        timeForecastTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        timeForecastTableView.tag = 0
        timeForecastTableView.bounces = false
        timeForecastTableView.backgroundColor = ColorConstants.backgroundTableColor
        
        tenDaysForecastTableView.tag = 1
        tenDaysForecastTableView.bounces = false
        tenDaysForecastTableView.backgroundColor = ColorConstants.backgroundTableColor
        
        timeForecastTableView.isScrollEnabled = false
        
        timeForecastTableView.layer.cornerRadius = SizesConstants.tableViewCornerRadius
        tenDaysForecastTableView.layer.cornerRadius = SizesConstants.tableViewCornerRadius
        
        tenDaysForecastTableView.showsVerticalScrollIndicator = false
        
        tenDaysForecastTableView.separatorColor = ColorConstants.separatorColor
        timeForecastTableView.separatorColor = ColorConstants.separatorColor
        
        //constraints
        NSLayoutConstraint.activate(
            [
            cityNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: SizesConstants.cityLabelTopAnchor),
            cityNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityNameLabel.heightAnchor.constraint(equalToConstant: SizesConstants.cityLabelHeightAnchor),
            cityNameLabel.widthAnchor.constraint(equalToConstant: SizesConstants.cityLabelWidthAnchor),
            
            cityTempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityTempLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: SizesConstants.cityTempLabelTopAnchor),
            
             
             
            timeForecastTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: SizesConstants.tableLeftOrRightAnchor),
            timeForecastTableView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -SizesConstants.timeForecastTableViewCenterYAnchor),
            timeForecastTableView.heightAnchor.constraint(equalToConstant: SizesConstants.timeForecastTableViewHeightAnchor),
             timeForecastTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -SizesConstants.tableLeftOrRightAnchor),
             
            
            tenDaysForecastTableView.topAnchor.constraint(equalTo: timeForecastTableView.bottomAnchor, constant: SizesConstants.tenDaysForecastTableViewTopAnchor),
            tenDaysForecastTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -SizesConstants.tenDaysForecastTableViewTBottomAnchor),
            tenDaysForecastTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: SizesConstants.tableLeftOrRightAnchor),
            tenDaysForecastTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -SizesConstants.tableLeftOrRightAnchor)
             
            ])
    }
}



extension WeatherView: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return cellDailyData.count
        }
        else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell = tenDaysForecastTableView.dequeueReusableCell(withIdentifier: DailyTableCell.reuseId, for: indexPath) as! DailyTableCell
        cell.set(data: cellDailyData[indexPath.row], index: indexPath.row)
        return cell
        } else
        {
            let cell = timeForecastTableView.dequeueReusableCell(withIdentifier: TimeForecastTableViewCell.reuseId, for: indexPath) as! TimeForecastTableViewCell
            cell.set(data: cellData)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView.tag == 1 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TenDaysForecastTableHeader.identifier) as! TenDaysForecastTableHeader
            return header
        } else {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TimeForecastTableHeader.identifier) as! TimeForecastTableHeader
            header.weatherDescriptionLabel.text = weatherData.weatherDataNewDescription
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 1 {
            return 30
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            return 49
        } else {
            return 116
        }
    }
}
