//
//  ChatViewController.swift
//  ChatList
//
//  Created by Hakyung Sohn on 9/11/24.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var chatList: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
        
        chatList = chatList.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date // 조건문: descending order
        })
    }
    
}

extension ChatViewController: UICollectionViewDataSource {
    // data
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        chatList.count
    }
    
    // cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCollectionViewCell", for: indexPath) as? ChatCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.config(chatList[indexPath.item])
        return cell
    }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
