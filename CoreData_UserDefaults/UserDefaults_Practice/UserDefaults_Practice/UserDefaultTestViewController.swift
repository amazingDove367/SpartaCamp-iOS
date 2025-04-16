//
//  ViewController.swift
//  UserDefaults_Practice
//
//  Created by kingj on 4/16/25.
//

import UIKit

class UserDefaultTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create
        UserDefaults.standard.set("010-1111-2222", forKey: "phoneNumber")
        
        // Update
        UserDefaults.standard.set("010-2222-3333", forKey: "phoneNumber")
        
        // Delete
        UserDefaults.standard.removeObject(forKey: "phoneNumber")
                
        // Read
        guard let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") else {
            print("저장된 전화번호가 없습니다.")
            return
        }
        
        /*
         UserDefaults에 set할때 넣는 값: 원시타입
         * 원시타입?
           - Int, String, Bool 등 기본 데이터 타입
         * struct, class 은 저장 못하나?
           - JSON으로 인코딩하여 넣어주면 된다!
         */
    }
}

