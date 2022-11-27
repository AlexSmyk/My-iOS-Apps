//
//  TimeForecastCollectionView.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 21.11.22.
//

import Foundation
import UIKit


class TimeForecastCollectionView: UICollectionView {
    
    var cellData: [WeatherPerDay] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .green
//        delegate = self
//        dataSource = self
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func set(cells: [WeatherPerDay]) {
        self.cellData = cells
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cellData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = dequeueReusableCell(withReuseIdentifier: TimeForecastCollectionViewCell.reuseId, for: indexPath) as! TimeForecastCollectionViewCell
//        cell.set(data: cellData[indexPath.row], index: indexPath.row)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 90)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TimeForecastCollectionViewHeader.identifier, for: indexPath) as! TimeForecastCollectionViewHeader
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        if section == 0 {
//                    return .zero
//                }
//        return CGSize(width: 20, height: 20)
//    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
