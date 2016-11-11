//
//  DetailViewController.swift
//  W1_lab_challengeOne_facebook
//
//  Created by user on 10/12/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var likeButtonSelected: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentBar: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = detailImageView.frame.size
        likeButtonSelected.isHidden = true

    }
    @IBAction func onTapLikeButton(_ sender: AnyObject) {
        likeButtonSelected.isHidden = false
        
    }
    
    
    @IBAction func onTapSelectedLikeButton(_ sender: AnyObject) {
        likeButtonSelected.isHidden = true
    }

    @IBAction func onBacKButotn(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)

    }
    
    @IBAction func onTapComment(_ sender: AnyObject) {
        commentTextField.becomeFirstResponder()
        animateComment()
        
    }
    @IBAction func onTapPost(_ sender: AnyObject) {
        commentTextField.endEditing(true)
        print("tapPost works")
        animateCommentBack()
        
        
    }
    
    
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func animateComment() {
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            self.commentTextField.transform = CGAffineTransform(translationX: 0, y: -272)
            self.commentBar.transform = CGAffineTransform(translationX: 0, y: -269)
            self.postButton.transform = CGAffineTransform(translationX: 0, y: -269)
            
            
            print("animation works")
            
                       }, completion: nil)
    }
    
    func animateCommentBack() {
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            self.commentTextField.transform = CGAffineTransform(translationX: 0, y: 0)
            self.commentBar.transform = CGAffineTransform(translationX: 0, y: 0)
            self.postButton.transform = CGAffineTransform(translationX: 0, y: 0)
            
            
            
            print("back animation works")
            
            }, completion: nil)
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
