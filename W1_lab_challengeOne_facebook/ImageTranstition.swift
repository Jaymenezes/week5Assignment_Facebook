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
    var originalTappedImageViewFrame: CGRect!

    var blackView: UIView!
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
   
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        let tappedPhotoViewController = toViewController as! TappedPhotoViewController
        
       
        
        let selectedImageView = feedViewController.selectedImageView
        let tappedPhotoImageView = tappedPhotoViewController.tappedImageView
        
        
        originalSelectedImageViewFrame = selectedImageView!.frame.offsetBy(dx: 0, dy: 126)

        
        selectedImageView!.isHidden = true
        
        //create lightBoxBG
        blackView = UIView(frame: tappedPhotoViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        containerView.addSubview(blackView)

        
        // creating window

        let movingImage = UIImageView(frame: originalSelectedImageViewFrame)
        movingImage.contentMode = UIViewContentMode.scaleAspectFill
        movingImage.clipsToBounds = selectedImageView!.clipsToBounds
        movingImage.image =  selectedImageView!.image
        let window = UIApplication.shared.keyWindow
        window?.addSubview(movingImage)
        
        
  
        
        containerView.addSubview((tappedPhotoViewController.view)!)
        tappedPhotoViewController.view.alpha = 0

        UIView.animate(withDuration: duration, animations: {
            tappedPhotoViewController.tappedImageView.isHidden = true
            tappedPhotoViewController.view.alpha = 1
            self.blackView.alpha = 1
            
            movingImage.frame = tappedPhotoViewController.tappedImageView.frame.offsetBy(dx: 0, dy: 52)
            movingImage.contentMode = UIViewContentMode.scaleAspectFit

            
        }) { (finished: Bool) -> Void in
            movingImage.contentMode = (tappedPhotoImageView?.contentMode)!

            movingImage.clipsToBounds = tappedPhotoImageView!.clipsToBounds
            
            movingImage.removeFromSuperview()
            self.blackView.removeFromSuperview()
            tappedPhotoViewController.tappedImageView.isHidden = false
            selectedImageView?.isHidden = false
            self.finish()
        }
        
            

            
       
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        let tappedPhotoViewController = fromViewController as! TappedPhotoViewController
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! FeedViewController
        
        
        let selectedImageView = feedViewController.selectedImageView
        let tappedPhotoImageView = tappedPhotoViewController.tappedImageView
        
        originalTappedImageViewFrame = tappedPhotoImageView!.frame.offsetBy(dx: 0, dy: 52)
        
        
        selectedImageView!.isHidden = true
        

        
        
        // creating window
        
        let movingImage = UIImageView(frame: originalTappedImageViewFrame)
        movingImage.contentMode = UIViewContentMode.scaleAspectFill
        movingImage.clipsToBounds = selectedImageView!.clipsToBounds
        movingImage.image =  tappedPhotoImageView!.image
        let window = UIApplication.shared.keyWindow
        window?.addSubview(movingImage)
        
        
        blackView = UIView(frame: tappedPhotoViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        containerView.addSubview(blackView)
        self.blackView.alpha = 0.4

        UIView.animate(withDuration: duration, animations: {
            tappedPhotoImageView?.isHidden = true
            self.blackView.alpha = 0
            
            movingImage.frame = selectedImageView!.frame.offsetBy(dx: 0, dy: 126)
            movingImage.contentMode = (tappedPhotoImageView?.contentMode)!
            
            
        }) { (finished: Bool) -> Void in
            movingImage.contentMode = (tappedPhotoImageView?.contentMode)!
            movingImage.clipsToBounds = tappedPhotoImageView!.clipsToBounds

            movingImage.removeFromSuperview()
            self.blackView.removeFromSuperview()
            
            selectedImageView?.isHidden = false
            self.finish()
        }




     
    }
    
    

}
