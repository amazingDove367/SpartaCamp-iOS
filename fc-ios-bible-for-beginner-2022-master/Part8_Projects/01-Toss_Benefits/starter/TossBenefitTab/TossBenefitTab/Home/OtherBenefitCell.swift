//
//  OtherBenefitCell.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/18/24.
//

import UIKit

class OtherBenefitCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var ctaTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(item benefit: Benefit) {
        self.imageView.image = UIImage(named: benefit.imageName)
        self.title.text = benefit.title
        self.ctaTitle.text = benefit.ctaTitle
    }
}
