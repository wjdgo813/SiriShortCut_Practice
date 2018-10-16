//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Peter Minarik on 01.07.18.
//  Copyright © 2018 Peter Minarik. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {
  
  
  @IBOutlet weak var imageVIew: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    donateInteraction()
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    
    let photoInfoController = PhotoInfoController()
    photoInfoController.fetchPhotoOfTheDay { (photoInfo) in
      if let photoInfo = photoInfo {
        self.updateUI(with: photoInfo)
      }
    }
  }
  
  func updateUI(with photoInfo: PhotoInfo) {
    let photoInfoController = PhotoInfoController()
    photoInfoController.fetchUrlData(with: photoInfo.url) { (data) in
      guard
        let data = data,
        let image = UIImage(data: data)
      else {
        return
      }
      
      DispatchQueue.main.async {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        self.title = photoInfo.title
        self.imageVIew.image = image
      }
    }
  }
    
    
    func donateInteraction() {
        let intent = PhotoOfTheDayIntent()
        
        intent.suggestedInvocationPhrase = "에너자이자이자식아"
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("failed!!!!")
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }

}

