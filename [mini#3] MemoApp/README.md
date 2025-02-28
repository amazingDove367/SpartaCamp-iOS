# [mini #3] 매모 앱 📝
- 개인 미니 프로젝트
- UIKit 코드로 작성된 UI 

<br>

## 프로젝트 소개
메모 앱은 사용자가 메모를 추가, 삭제하고 저장할 수 있는 간단한 리스트 앱입니다. <br>
UITableView와 UserDefaults를 활용하여 데이터 관리와 리스트 UI 구현을 연습할 수 있는 프로젝트입니다.

<br>

## 구현된 기능
- **메모 추가**  :
    - "+" 버튼을 눌러 새로운 메모를 추가
    - 추가된 메모는 리스트에 표시

- **메모 삭제**  :  리스트에서 특정 메모를 스와이프하여 삭제

- **데이터 저장**  :  앱 종료 후에도 메모 리스트가 유지되도록 UserDefaults를 활용해 데이터 저장 및 불러오기
 
<br>

## 핵심 코드
1. UITableViewCell Class Programmatically 생성 & 세팅

  - [MemoCell.swift] dequeueReusableCell identifier setting
  ```swift
  class MemoCell: UITableViewCell {
      static let identifier = "MemoCell" // 🔴 setting1
  
      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { // 🔴 setting2
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          configureAutoLayout()
      }
      
      required init?(coder: NSCoder) { // 🔴 setting3
          fatalError("init(coder:) has not been implemented") 
      }

      ...
  }
  ```

<br>

2. Register UITableViewCell class for the identifier
  - [MemoViewController.swift] tableView.register(_: forCellReuseIdentifier: )
  
  ![Screenshot 2025-02-27 at 3 16 57 pm](https://github.com/user-attachments/assets/0ae00cd4-5b5c-4200-8c03-232c2b8f81a0)

  ```swift
  class MemoViewController: UIViewController {
    
      let tableView = UITableView()
  
      ...
  
      override func viewDidLoad() {
          super.viewDidLoad()
          configureTableView()
      }
      
      func configureTableView() {
          view.addSubview(tableView)
          
          tableView.delegate = self
          tableView.dataSource = self
          tableView.register(MemoCell.self, forCellReuseIdentifier: MemoCell.identifier) // 🔴
      }
  }
  ```

<br>
<br>

3. Using UIAlertAction
   - table cell 추가 
  
    ```swift
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
    ```

   <br>

   - table cell 밀어서 삭제
  
    ```swift
    extension MemoViewController: UITableViewDelegate {
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              memoData.remove(at: indexPath.row)
              saveInUserDefaults()
              tableView.deleteRows(at: [indexPath], with: .automatic)
          }
      }
    }
    ```



<br>
<br>


4. Using UserDefaults
  ```swift
  func saveInUserDefaults() {
        UserDefaults.standard.set(memoData, forKey: "memoData")
  }
    
    func loadFromUserDefaults() {
        if let savedMemoData = UserDefaults.standard.array(forKey: "memoData") as? [String] {
            memoData = savedMemoData
        }
  }
  ```



<br>

<br>

## 데모


https://github.com/user-attachments/assets/645dd464-e544-4ba5-8d33-0f6705113c25

