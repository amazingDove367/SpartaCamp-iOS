//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by Hakyung Sohn on 9/26/24.
//

import UIKit
import SafariServices

class FrameworkDetailViewController: UIViewController {

    @IBOutlet weak var frameworkImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var learnMoreButton: UIButton!
    
    var framework: AppleFramework = AppleFramework(name: "unknown", imageName: "", urlString: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        frameworkImage.image = UIImage(named: framework.imageName)
        titleLable.text = framework.name
        descriptionLable.text = framework.description
    }
    
    @IBAction func learnMoreButtonTapped(_ sender: Any) {
        guard let url = URL(string: framework.urlString) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
