//
//  RequestsViewController.swift
//  W1_lab_challengeOne_facebook
//
//  Created by user on 10/12/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController, UIScrollViewDelegate {
    
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var requestsPage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.delegate = self
        scrollView.contentSize = requestsPage.frame.size

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
