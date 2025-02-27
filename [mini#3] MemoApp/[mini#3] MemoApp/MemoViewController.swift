//
//  MemoViewController.swift
//  [mini#3] MemoApp
//
//  Created by King Jesus on 2/27/25.
//

import UIKit

class MemoViewController: UIViewController {
    
    let tableView = UITableView()
    
    var memoData = ["Memo data1", "Memo data2", "Memo data3", "Memo data4", "Memo data5", ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    func configureUI() {
        tableView.backgroundColor = .yellow
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false // In order to constraint a UIView (which UITableView is a subclass of)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: MemoCell.identifier, for: indexPath) as? MemoCell else {
            return UITableViewCell(style: .value1, reuseIdentifier: MemoCell.identifier)
        }
        
        cell.configureCell(memoData: memoData[indexPath.item])
        return cell
    }
}

extension MemoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
