//
//  TimeForecastTableViewCell.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 22.11.22.
//

import UIKit

final class TimeForecastTableViewCell: UITableViewCell {

    static let reuseId = "TimeForecastTableViewCell"

    var cellData: [WeatherPerDay] = []
    
    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.collectionView = UICollectionView(frame: CGRect(x: self.frame.minX + SizesConstants.collectionViewFrameXAxisShift,
                                                             y: self.frame.minY + SizesConstants.collectionViewFrameYAxisShift,
                                                             width: self.bounds.width, height: SizesConstants.collectionViewHeight),
                                                             collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(TimeForecastCollectionViewCell.self, forCellWithReuseIdentifier: TimeForecastCollectionViewCell.reuseId)
        self.addSubview(self.collectionView)
        setParametrs()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: [WeatherPerDay]) {
        cellData = data
    }
    
    func setParametrs() {
        backgroundColor = ColorConstants.timeForecastTableViewCellBackgroundColor
        self.selectionStyle = .none
        self.collectionView.isScrollEnabled = true
        self.collectionView.backgroundColor = ColorConstants.collectionViewBackgroundColor
        contentView.isUserInteractionEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
}

extension TimeForecastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeForecastCollectionViewCell.reuseId, for: indexPath) as! TimeForecastCollectionViewCell
        cell.set(data: cellData[indexPath.row], index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if cellData[indexPath.row].sunset == true {
            return CGSize(width: SizesConstants.collectionViewCellWideWidth, height: SizesConstants.collectionViewHeight)
        }
        else {
            return CGSize(width: SizesConstants.collectionViewCellRegularWidth, height: SizesConstants.collectionViewHeight)
        }
    }
}
