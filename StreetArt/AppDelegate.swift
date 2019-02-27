//
//  AppDelegate.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 25/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import UIKit

let appName = "Amadora Art Street"
let artDetailViewController = "artDetailViewController"
let cardViewNib = "CardView"
let imagesCollectionViewController = "ImagesCollectionViewController"
let imageCache = NSCache<NSString, UIImage>()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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

extension UIImageView{
    
    func loadIt(imgUrl: String?) {
       let theImg = imgUrl ?? ""
        
        if !theImg.contains("http") {
            loadLocalImage(imgName: theImg)
            return
        }
        
        if let aa = imageCache.object(forKey: theImg as NSString){
            self.image = aa
        }else {
            self.image = UIImage(named: "loading")

                DispatchQueue.global(qos: .default).async(execute: {() -> Void in
                    
                    var theImage: UIImage?
                    if let imageData: NSData = NSData(contentsOf: URL(string: theImg)!) {
                        theImage = UIImage(data: imageData as Data)
                    }else{
                        theImage = UIImage(named: "noimage")
                    }
                    imageCache.setObject(theImage!, forKey: theImg as NSString)
                    DispatchQueue.main.async(execute: {() -> Void in
                        self.image = theImage
                    })
                    
                })
            
        }
        
    }
    
    private func loadLocalImage(imgName: String){
        if imgName.isEmpty {
            self.image = UIImage(named: "noimage")
        }else{
            self.image = UIImage(named: imgName)
        }
        
    }

}

