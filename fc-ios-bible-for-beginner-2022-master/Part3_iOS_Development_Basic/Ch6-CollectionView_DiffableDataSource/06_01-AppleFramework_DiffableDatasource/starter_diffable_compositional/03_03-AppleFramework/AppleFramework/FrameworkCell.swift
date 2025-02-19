//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by Hakyung Sohn on 9/10/24.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // ⭐️
        name.numberOfLines = 1
        name.adjustsFontSizeToFitWidth = true
    }
    
    func config(_ framework: AppleFramework) {
        image.image = UIImage(named: framework.imageName)
        name.text = framework.name
    }
}
