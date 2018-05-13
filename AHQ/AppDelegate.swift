 //
//  AppDelegate.swift
//  AHQ
//
//  Created by LIYU ZHANG on 13/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // for unity
    var application: UIApplication?
    
    @objc var currentUnityController: UnityAppController!
    
    var isUnityRunning = false


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = "730337957622-b2hfk5no3qqt6g59idtskksmj1blckd9.apps.googleusercontent.com"
        
        // for unity
        self.application = application
        unity_init(CommandLine.argc, CommandLine.unsafeArgv)
        
        currentUnityController = UnityAppController()
        currentUnityController.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // first call to startUnity will do some init stuff, so just call it here and directly stop it again
        startUnity()
        stopUnity()
        
        return true
    }
    
//    // the method should call the handleURL method of the GIDSignIn instance, which will properly handle the URL that your application receives at the end of the authentication process.
//    @available(iOS 9.0, *)
//    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
//        -> Bool {
//            return GIDSignIn.sharedInstance().handle(url,
//                                                        sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
//                                                        annotation: [:])
//    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
        let annotation = options[UIApplicationOpenURLOptionsKey.annotation]
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
    }
    
//    // to handle the sign-in process
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
//              withError error: Error!) {
//        if let error = error {
//            print("\(error.localizedDescription)")
//        } else {
//            // Perform any operations on signed in user here.
////            let userId = user.userID                  // For client-side use only!
////            let idToken = user.authentication.idToken // Safe to send to the server
////            let fullName = user.profile.name
////            let givenName = user.profile.givenName
////            let familyName = user.profile.familyName
////            let email = user.profile.email
//            print("WOWOWOWOWOWO, signed in!!!!!")
//            // ...
//        }
//    }
//
//    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
//              withError error: Error!) {
//        // Perform any operations when the user disconnects from app here.
//        // ...
//    }
    
    
    // **************************
    // orginally build in methods
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        if isUnityRunning {
            currentUnityController.applicationWillResignActive(application)
        }    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if isUnityRunning {
            currentUnityController.applicationDidEnterBackground(application)
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        if isUnityRunning {
            currentUnityController.applicationWillEnterForeground(application)
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if isUnityRunning {
            currentUnityController.applicationDidBecomeActive(application)
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        if isUnityRunning {
            currentUnityController.applicationWillTerminate(application)
        }
    }
    
    func startUnity() {
        if !isUnityRunning {
            isUnityRunning = true
            currentUnityController.applicationDidBecomeActive(application!)
        }
    }
    
    func stopUnity() {
        if isUnityRunning {
            currentUnityController.applicationWillResignActive(application!)
            isUnityRunning = false
        }
    }

}

