//
//  MyPointCell.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/18/24.
//

import UIKit

class MyPointCell: UICollectionViewCell {
    
    @IBOutlet weak var myPointLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(item myPoint: MyPoint) {
        self.imageView.image = UIImage(named: "ic_point")
        self.myPointLabel.text = "\(myPoint.point) 원"
    }
}
