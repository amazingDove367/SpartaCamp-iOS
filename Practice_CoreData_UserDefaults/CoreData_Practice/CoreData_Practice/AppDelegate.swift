//
//  AppDelegate.swift
//  CoreData_Practice
//
//  Created by kingj on 4/16/25.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    /// ➡️ CoreData에서 데이터를 저장하고 관리하는데 필요한 핵심 객체
    /// -> 직역하면, 영구적인 저장소
    /// ➡️ persistentContainer: CoreData와 프로젝트 사이에 데이터를 주고받을 수 있는 매개체
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        
        // ➡️ NSPersistentContainer: name으로 할당된 파일에 찾아가서, 그곳의 Entity, Attribute를 가져와 사용할 수 있도록 도와주는 매개체 클래스이다.
        let container = NSPersistentContainer(name: "CoreData_Practice")
        
        // ➡️ loadPersistentStores: 영구적 저장소를 불러온다.
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    /// ➡️ 데이터의 업데이트 (추가, 업데이트, 삭제 등)가 일어났으면 이 함수를 호출하여 그 문맥을 저장한다.
    /// -> 직역하면, 문맥을 저장하다.
    ///
    /// ➡️ 앱이 코어데이터를 사용할때, 항상 어떤 맥락 / 상태로 돌아가고 있는지 체크해줄 필요가 있다.
    /// 따라서, Context는 문맥, 맥락, 상황이라는 뜻과 같이, CoreData에서 데이터에 변조가 일어났을때,
    /// saveContext() 를 활용하여 문맥을 저장할 필요가 있다.
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

