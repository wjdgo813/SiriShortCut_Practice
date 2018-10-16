//
//  IntentHandler.swift
//  SpacePhotoIntent
//
//  Created by Haehyeon Jeong on 2018. 10. 16..
//  Copyright © 2018년 Peter Minarik. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        //PhotoOfTheDayIntent : Intents.intentdefinition에서 newIntent하면 자동으로 생성
        guard intent is PhotoOfTheDayIntent else {
            fatalError("Unhandled intent type: \(intent)")
        }
        
        return PhotoOfTheDayIntentHandler()
    }
    
}
