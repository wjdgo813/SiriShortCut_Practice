//
//  ViewController.swift
//  SiriShortcutPrac
//
//  Created by Haehyeon Jeong on 2018. 9. 28..
//  Copyright © 2018년 JHH. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        let activity = NSUserActivity(activityType: "JHH.SiriShortcutPrac.makeRed")
        activity.title = "빨강으로 만들자."
        activity.userInfo = ["color":"red"]
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier(stringLiteral: "JHH.SiriShortcutPrac.makeRed")
        view.userActivity = activity
        activity.becomeCurrent()
        
        makeViewRed()
    }
    
    func makeViewRed(){
        view.backgroundColor = .red
    }
}

