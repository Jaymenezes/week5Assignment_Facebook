//
//  FeedViewController.swift
//  W1_lab_challengeOne_facebook
//
//  Created by user on 10/12/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var homeFeed: UIImageView!
    var imageTransition: ImageTranstition!
    var selectedImageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedScrollView.delegate = self
        feedScrollView.contentSize = homeFeed.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPhotoImageView(_ sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        selectedImageView.frame = sender.view!.frame
        performSegue(withIdentifier: "segueToTappedPhoto", sender: nil)
        sender.numberOfTapsRequired = 2
        
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
 
        let tappedPhotoViewController = segue.destination as! TappedPhotoViewController
        
        tappedPhotoViewController.modalPresentationStyle = .custom
        
        imageTransition = ImageTranstition()
        
        tappedPhotoViewController.transitioningDelegate = imageTransition
        
        imageTransition.duration = 1
                tappedPhotoViewController.image = selectedImageView.image


    }
    

}
