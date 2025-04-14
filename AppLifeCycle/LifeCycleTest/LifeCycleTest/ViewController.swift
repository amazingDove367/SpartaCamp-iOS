//
//  ViewController.swift
//  LifeCycleTest
//
//  Created by kingj on 4/14/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("다음 페이지로 이동", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        // * addTarget의 self로 인한 Warning
        //   -> 'self' refers to the method 'ViewController.self', which may be unexpected
        //   -> button에 대한 초기화하는 시점에, 이 view의 모든것이 초기화 되지 X => lazy 키워드
        //   * lazy 란?
        //     - let: 코드가 읽히는 시점에 초기화 코드가 실행됨
        //     - lazy var: 코드 어디에선가 button을 호출할 때, 초기화 코드가 실행되면서 초기화 시점을 늦추게 하는 코드
        //                 코드가  button을 호출할 때는, viewController가 초기화가 끝난 때이니, self 사용 가능
        return button
    }()

    // 1. Memory 위에 올리는 LifeCycle은 한번 불림
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        print("viewDidLoad")
    }
    
    // 2~6. : View LifeCycle은 View Stack(계층)에 따라 불림
    // 2.
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }

    // 3.
    override func viewIsAppearing(_ animated: Bool) {
        print("viewIsAppearing")
    }
    
    // 4.
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    // 5. view가 사라질때 불리는 메소드들
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    // 6.
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    @objc
    private func buttonTapped() {
        // SceneDelegate에서 설정한 UINavigationController(rootView: ViewController()) 에서
        // 다음 ViewController을 push해줘
        self.navigationController?.pushViewController(SubViewController(), animated: true)
    }
    
    private func configureUI() {
        [button].forEach { view.addSubview($0) }
        
        view.backgroundColor = .white
        
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
    }
}

