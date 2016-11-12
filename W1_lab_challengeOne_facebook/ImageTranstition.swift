//
//  ImageTranstition.swift
//  week5Lab_tinder
//
//  Created by user on 11/10/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class ImageTranstition: BaseTransition {
    
    
    var originalSelectedImageViewFrame: CGRect!
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
   
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let tappedPhotoViewController = toViewController as! TappedPhotoViewController
        

       
        
        let selectedImageView = feedViewController.selectedImageView
        let tappedPhotoImageView = tappedPhotoViewController.tappedImageView
        
        originalSelectedImageViewFrame = selectedImageView!.frame

        
        selectedImageView!.isHidden = true
        
        // creating window

        let movingImage = UIImageView(frame: originalSelectedImageViewFrame)
        movingImage.frame = originalSelectedImageViewFrame
        movingImage.image =  selectedImageView?.image
        movingImage.contentMode = (selectedImageView?.contentMode)!
        movingImage.clipsToBounds = (selectedImageView?
            .clipsToBounds)!
        
        let window = UIApplication.shared.keyWindow
        window?.addSubview(movingImage)
        
        
        tappedPhotoViewController.tappedImageView.isHidden = true
        containerView.addSubview((tappedPhotoViewController.view)!)
        tappedPhotoViewController.view.alpha = 0

        UIView.animate(withDuration: duration, animations: {
            tappedPhotoViewController.view.alpha = 1
            movingImage.frame = tappedPhotoViewController.tappedImageView.frame
            movingImage.contentMode = tappedPhotoViewController.tappedImageView.contentMode
            movingImage.clipsToBounds = tappedPhotoViewController.tappedImageView.clipsToBounds

            
        }) { (finished: Bool) -> Void in
            movingImage.removeFromSuperview()
            tappedPhotoViewController.tappedImageView.isHidden = false
            selectedImageView?.isHidden = false
            self.finish()
        }
        
            

            
       
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
//        let profileViewController = fromViewController as! CardsProfileViewController
//        let profileImageView = profileViewController.profilePhotoImage
//        originalCardsImageViewFrame = profileImageView!.frame
//        
//        
//        let cardsViewController = toViewController as! CardsViewController
//        let cardsImageView = cardsViewController.mainPhoto
        
        
//        profileImageView!.frame = self.originalCardsImageViewFrame

        UIView.animate(withDuration: duration, animations: {
//            profileImageView!.frame = (cardsImageView!.frame)

            
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    

}
