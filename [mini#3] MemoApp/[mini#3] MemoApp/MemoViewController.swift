//
//  MemoViewController.swift
//  [mini#3] MemoApp
//
//  Created by King J on 2/28/25.
//

import UIKit

class MemoViewController: UIViewController {
    
    let tableView = UITableView()
    
    var memoData: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MEMO"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus")?.withTintColor(.label, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(writeMemo))
        configureUI()
        configureTableView()
        loadFromUserDefaults()
    }
    
    func configureUI() {
        tableView.backgroundColor = .orange
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false // In order to constraint a UIView (which UITableView is a subclass of)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MemoCell.self, forCellReuseIdentifier: MemoCell.identifier) // 🔴
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
        cell.selectionStyle = .none
        return cell
    }
}

extension MemoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            memoData.remove(at: indexPath.row)
            saveInUserDefaults()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension MemoViewController {
    @objc func writeMemo() {
        let memoAlert = UIAlertController(title: "새로운 메모", message: "메모 내용을 입력하세요.", preferredStyle: .alert)
        memoAlert.addTextField()
        
        let addAction = UIAlertAction(title: "추가", style: .default) { _ in
            if let text = memoAlert.textFields?.first?.text,
               !text.isEmpty {
                self.memoData.append(text)
                self.saveInUserDefaults()
                self.tableView.reloadData()
            }
        }
        
        let closeAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        memoAlert.addAction(addAction)
        memoAlert.addAction(closeAction)
        
        self.present(memoAlert, animated: true, completion: nil)
    }
    
    func saveInUserDefaults() {
        UserDefaults.standard.set(memoData, forKey: "memoData")
    }
    
    func loadFromUserDefaults() {
        if let savedMemoData = UserDefaults.standard.array(forKey: "memoData") as? [String] {
            memoData = savedMemoData
        }
    }
}
