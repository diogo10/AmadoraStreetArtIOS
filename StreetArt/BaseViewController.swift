//
//  BaseViewController.swift
//  StreetArt
//
//  Created by Diogo Ribeiro on 27/02/2019.
//  Copyright © 2019 Diogo Ribeiro. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func shareIt(message: String, imgURL: String)  {
        
        if let link = NSURL(string: imgURL )
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}
