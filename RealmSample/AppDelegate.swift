//
//  AppDelegate.swift
//  RealmSample
//
//  Created by 永田大祐 on 2016/10/01.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        self.window = window
        window.frame = UIScreen.main.bounds
        window.makeKeyAndVisible()

        let vm = MagnificationViewModel()
       // let vc = ViewController(viewModel: vm)
      //  let nc = UINavigationController(rootViewController: vc)
        
        window.rootViewController = ViewController.viewController()


		let config = Realm.Configuration(
			// 新しいスキーマバージョンを設定します。 これは以前に使用されたものよりも大きくなければなりません
			// version（以前にスキーマバージョンを設定していない場合、バージョンは0です）。
			schemaVersion: 2,
			
			//スキーマのバージョンが上記のものよりも低い/を開くときに自動的に呼び出されるブロックを設定する
				migrationBlock: { migration, oldSchemaVersion in
    //まだ何も移行していないので、oldSchemaVersion == 0
    if (oldSchemaVersion < 1) {
		// Realmは新しいプロパティと削除されたプロパティを自動的に検出します
		//そして自動的にディスク上のスキーマを更新する
    }
  })
		
		// Tell Realm to use this new configuration object for the default Realm
		Realm.Configuration.defaultConfiguration = config
		
		//デフォルトのレルムに対してこの新しい設定オブジェクトを使用するようにRealmに指示します
		let realm = try! Realm()
		print(realm, "Realm")
		print(config,"Realm Version")
  
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}

}
