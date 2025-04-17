//
//  ViewController.swift
//  CoreData_Practice
//
//  Created by kingj on 4/16/25.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var container: NSPersistentContainer!
    // 반드시 사용한다는 확신의 의미 부여: !
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AppDelegate에 접근하여, CoreData_Practice에 접근할 수 있게 됨
        // UIApplication.shared.delegate : 기본적으로 제공해주는 프로퍼티
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        
        // 1. ViewController가 메모리 위에 올라왔을때 (= viewDidLoad),
        // 2. PhoneBook entity를 생성하고, (= entity)
        // 3. CoreData에 맞는 객체로 생성하고, (= newPhoneBook)
        // 4. newPhoneBook안에 Attribute (name, phoneNumber)의 값 세팅,
        // 5. CoreData안에 데이터를 생성했기 때문에 = 데이터 변조 (CURD)가 일어났기 때문에 => save() 호출
        createData(name: "Dove", phoneNumber: "010-1111-2222")
        
        readAllData()
        
        updateData(currentName: "Dove", updateName: "Abel")
        
        readAllData()
        
        deleteData(name: "Abel")
        
        readAllData()
    }
    
    /// CREATE
    /// CoreData_Practice 에 데이터 Create.
    func createData(name: String, phoneNumber: String) {
        
        // 데이터 생성은, 엔티티 형태를 지켜서 삽입
        // NSEntityDescription.entity : Entity를 새로 정의하겠다.
        // forEntityName: 어떤 Entity인지
        // "PhoneBook": 정의했던 Entity 이름
        // in: 어떤 Context안에?
        //.   -> self.container.viewContext 즉 이 컨테이너의 맥락에
        //    -> in의 타입은 NSManagedObjectContext이다.
        guard let entity = NSEntityDescription.entity(forEntityName: PhoneBook.className, in: self.container.viewContext) else { return }
        
        // NSManagedObject: CoreData에 의해 관리되는 객체라는 의미
        // newPhoneBook: 34번째 줄에서 만든 entity로 집어넣을 수 있는 객체를 만든 것임
        let newPhoneBook = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
        
        // Attribute 지정해주기
        // "name": PhoneBook+CoreDataProperties.swift > PhoneBook > name 에 집어넣겠다.
        //         name에 넣는다는 것은 = CoreData_Pratice안의 Attribute 중 String타입의 name에 지정한 값을 넣어주겠다!
        newPhoneBook.setValue(name, forKey: PhoneBook.Key.name)
        newPhoneBook.setValue(phoneNumber, forKey: PhoneBook.Key.phoneNumber)
        
        // AppDelegate에서, 데이터에 변조가 일어났으면 항상 불러줘야하는 메소드!
        do {
            // save()는 throwable한 메소드이기 때문에
            try self.container.viewContext.save()
            print("문맥 저장 성공")
        } catch {
            print("문맥 저장 실패")
        }
    }
    
    /// READ
    /// CoreData_Practice 에 데이터 Read.
    func readAllData() {
        do {
            let phoneBooks = try self.container.viewContext.fetch(PhoneBook.fetchRequest())
            
            // [NSManagedObject] type casting: NSManagedObject PhoneBook의 Key (= Attribute) 읽기 위함
            for phoneBook in phoneBooks as [NSManagedObject] {
                if let name = phoneBook.value(forKey: PhoneBook.Key.name) as? String,
                   let phoneNumber = phoneBook.value(forKey: PhoneBook.Key.phoneNumber) as? String {
                    print("name: \(name), phoneNumber: \(phoneNumber)")
                }
            }
        } catch {
            print("데이터 읽기 실패")
        }
    }
    
    /// UPDATE
    /// CoreData_Practice 에 데이터 Update.
    func updateData(currentName: String, updateName: String) {
        
        // 1. 데이터 조회
        let fetchRequest = PhoneBook.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", currentName)
        
        // PhoneBook.fetchRequest(): PhoneBook의 내용 조회
        // .predicate : 조건문을 건다.
        // name == currentName 인 name을 찾는다.
        
        do {
            // container에서 fetch하여 fetchRequest를 사용하여 검색한다.
            let result = try self.container.viewContext.fetch(fetchRequest)
            
            for data in result as [NSManagedObject] {
                // data중 name의 값을 updateName으로 update한다.
                data.setValue(updateName, forKey: PhoneBook.Key.name)
            }
            
            try self.container.viewContext.save()
            
            print("데이터 수정 성공")
        } catch {
            print("데이터 수정 실패")
        }
    }
    
    /// DELETE
    /// CoreData_Practice 에 데이터 Delete.
    func deleteData(name: String) {
        let fetchResult = PhoneBook.fetchRequest()
        fetchResult.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let result = try self.container.viewContext.fetch(fetchResult)
            
            for data in result as [NSManagedObject] {
                self.container.viewContext.delete(data)
            }
            
            try self.container.viewContext.save()
            
            print("데이터 삭제 성공")
        } catch {
            print("데이터 삭제 실패")
        }
    }
}

