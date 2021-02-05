//
//  AppDelegate.swift
//  DemoCoreData
//
//  Created by RyoNishimura on 2020/09/11.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
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

    // MARK: - CoreDataStackを設定するために必要なこと
    
    //　1:persistentContainerを呼び出すとNSPersistentContainerを継承したプロパティが作成
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        // 2:コンテナを呼び出す
        let container = NSPersistentCloudKitContainer(name: "DemoCoreData")
        /*
        loadPersistentStores(completionHandler:):永続ストアにロードする永続コンテナを指示
        3:containerに永続ストアをロード。これにより、CoreDataStackがセットアップされる
        */
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // 4:エラーチェック
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - CoreDataは自動的に処理をしないため、ディスクにデータを保存する方法

    func saveContext () {
        // 1:viewContext(永続コンテナの管理対象オブジェクトのコンテキスト)を取得
        let context = persistentContainer.viewContext
        // 2:hasChanges(コンテキストに変更があるかをboolで返す)でデータに変更があった場合のみ保存
        if context.hasChanges {
            do {
                // 3:保存する
                try context.save()
            } catch {
                // 4:エラー処理
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

