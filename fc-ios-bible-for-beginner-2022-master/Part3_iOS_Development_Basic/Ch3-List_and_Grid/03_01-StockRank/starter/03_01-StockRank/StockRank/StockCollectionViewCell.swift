//
//  StockCollectionViewCell.swift
//  StockRank
//
//  Created by Hakyung Sohn on 9/11/24.
//

import UIKit

class StockCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var diffLable: UILabel!
    
    func config(_ stockModel: StockModel) {
        numberLable.text = "\(stockModel.rank)"
        companyImage.image = UIImage(named: stockModel.imageName)
        companyName.text = "\(stockModel.name)"
        priceLable.text = "\(convertToCurrencyFormat(price: stockModel.price)) 원"
        
        diffLable.textColor = stockModel.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLable.text = "\(stockModel.diff)%"
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: price))!
    }
}
