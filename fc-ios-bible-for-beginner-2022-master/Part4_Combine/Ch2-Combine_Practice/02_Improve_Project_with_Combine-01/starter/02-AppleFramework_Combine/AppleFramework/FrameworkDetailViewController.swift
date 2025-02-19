//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/05/01.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Combine
    var subscriptions = Set<AnyCancellable>()
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "Unknown", imageName: "", urlString: "", description: ""))
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() { 
        // input : button clicked
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) } // 실패시 넘어기지 않음
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                present(safari, animated: true)
            }.store(in: &subscriptions)
        
        // output : 데이터 세팅 될 때, UI 업데이트
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        buttonTapped.send(framework.value)
    }
}
