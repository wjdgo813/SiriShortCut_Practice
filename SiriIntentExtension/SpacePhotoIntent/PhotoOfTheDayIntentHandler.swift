//
//  PhotoOfTheDayIntentHandler.swift
//  SpacePhotoIntent
//
//  Created by Haehyeon Jeong on 2018. 10. 16..
//  Copyright © 2018년 Peter Minarik. All rights reserved.
//

import Foundation

class PhotoOfTheDayIntentHandler: NSObject, PhotoOfTheDayIntentHandling {
    func handle(intent: PhotoOfTheDayIntent, completion: @escaping (PhotoOfTheDayIntentResponse) -> Void) {
        
        let photoInfoController = PhotoInfoController()
        photoInfoController.fetchPhotoOfTheDay { (photoInfo) in
            if let photoInfo = photoInfo {
                completion(PhotoOfTheDayIntentResponse.success(photoTitle: photoInfo.title))
            }
        }
        
    }
    
    
    
    func confirm(intent: PhotoOfTheDayIntent, completion: @escaping (PhotoOfTheDayIntentResponse) -> Void) {
        let photoInfoController = PhotoInfoController()
        photoInfoController.fetchPhotoOfTheDay { (photoInfo) in
            if let photoInfo = photoInfo {
                if photoInfo.isImage {
                    completion(PhotoOfTheDayIntentResponse(code: .ready, userActivity: nil))
                } else {
                    completion(PhotoOfTheDayIntentResponse(code: .failureNoImage, userActivity: nil))
                }
            }
        }
    }
    
    
}
