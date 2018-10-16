//
//  IntentViewController.swift
//  SpacePhotoIntentUI
//
//  Created by Haehyeon Jeong on 2018. 10. 16..
//  Copyright © 2018년 Peter Minarik. All rights reserved.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>,
                       of interaction: INInteraction,
                       interactiveBehavior: INUIInteractiveBehavior,
                       context: INUIHostedViewContext,
                       completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        guard interaction.intent is PhotoOfTheDayIntent else {
            completion(false, Set(), .zero)
            return
        }
        
        let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
        let desiredSize = CGSize(width: width, height: 600)
        
        let photoInfoController = PhotoInfoController()
        photoInfoController.fetchPhotoOfTheDay { (photoInfo) in
            if let photoInfo = photoInfo {
                photoInfoController.fetchUrlData(with: photoInfo.url) { [weak self] (data) in
                    if let data = data {
                        let image = UIImage(data: data)!
                        
                        DispatchQueue.main.async {
                            self?.imageView.image = image
                        }
                    }
                }
            }
        }

        
        completion(true, parameters, desiredSize)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
