//
//  ViewController.swift
//  SiriShortcutPrac
//
//  Created by Haehyeon Jeong on 2018. 9. 28..
//  Copyright © 2018년 JHH. All rights reserved.
//

import UIKit
import Intents
import IntentsUI

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
        activity.suggestedInvocationPhrase = "빨강이 되어보자"
        
        
        let shortcut = INShortcut(userActivity: activity)
        let vc = INUIAddVoiceShortcutViewController(shortcut: shortcut)
        vc.delegate = self
        
        self.present(vc, animated: true, completion: nil)
        
//        activity.becomeCurrent()
    }
    
    
    func makeViewRed(){
        view.backgroundColor = .red
    }
}



extension ViewController: INUIAddVoiceShortcutViewControllerDelegate {
    @available(iOS 12.0, *)
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @available(iOS 12.0, *)
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}
