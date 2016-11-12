//
//  TappedPhotoViewController.swift
//  W1_lab_challengeOne_facebook
//
//  Created by user on 11/11/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class TappedPhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tappedScrollView: UIScrollView!
    @IBOutlet weak var tappedImageView: UIImageView!
    @IBOutlet weak var tappedPhotoPageControl: UIPageControl!
    var tappedImageCenterX: CGFloat!
    var wedding_1: UIImage!
    var wedding_2: UIImage!
    var wedding_3: UIImage!
    var wedding_4: UIImage!
    var wedding_5: UIImage!

    
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedScrollView.delegate = self
        
        tappedImageCenterX = view.center.x
        tappedImageView.center.x = tappedImageCenterX
        
        tappedScrollView.contentSize = CGSize(width: 1875, height: 667)
        tappedScrollView.frame.size = CGSize(width: 375, height: 667)
        
        
        
        wedding_1 = UIImage(named: "wedding1")
        wedding_2 = UIImage(named: "wedding2")
        wedding_3 = UIImage(named: "wedding3")
        wedding_4 = UIImage(named: "wedding4")
        wedding_5 = UIImage(named: "wedding5")
        
        tappedPhotoPageControl.currentPage = 0
  
        let page: Int = Int(round(tappedScrollView.contentOffset.x / 375))
        tappedPhotoPageControl.currentPage = page
        
        if page == 0 {
            tappedImageView.image = wedding_1
            
        } else if page == 1 {
            tappedImageView.image = wedding_2
            
        } else if page == 2 {
            tappedImageView.image = wedding_3
        } else if page == 3 {
            tappedImageView.image = wedding_4
        } else if page == 4{
            tappedImageView.image = wedding_5
        }
     
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page: Int = Int(round(tappedScrollView.contentOffset.x / 375))
        tappedPhotoPageControl.currentPage = page
        if page == 0 {
            print("is on page 0")
            
            tappedImageView.image = wedding_1
            tappedImageView.center.x = tappedImageCenterX

            
        } else if page == 1 {
            print("is on page 1")
            tappedImageView.image = wedding_2
            tappedImageView.center.x = tappedImageCenterX * 3
            
        } else if page == 2 {
            print("is on page 2")
            tappedImageView.image = wedding_3
            tappedImageView.center.x = tappedImageCenterX * 5
        } else if page == 3 {
            tappedImageView.image = wedding_4
            tappedImageView.center.x = tappedImageCenterX * 7
        } else if page == 4{
            tappedImageView.image = wedding_5
            tappedImageView.center.x = tappedImageCenterX * 9
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
