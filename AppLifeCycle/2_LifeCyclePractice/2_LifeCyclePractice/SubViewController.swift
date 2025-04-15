//
//  SubViewController.swift
//  2_LifeCyclePractice
//
//  Created by kingj on 4/15/25.
//

import UIKit

class SubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\nSub viewDidLoad")
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Sub viewWillAppear")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        print("Sub viewIsAppearing")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Sub viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("Sub viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Sub viewDidDisappear")
    }
}
