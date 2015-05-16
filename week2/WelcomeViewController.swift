//
//  WelcomeViewController.swift
//  week2
//
//  Created by Hsin Yi Huang on 5/12/15.
//  Copyright (c) 2015 Hsin Yi Huang. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

   
    @IBOutlet weak var ctaView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var welcomeScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeScrollView.contentSize = CGSize(width: 1280, height: 568)
        welcomeScrollView.delegate = self
        ctaView.alpha = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        
        println("scroll end")
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        //last page
        if pageControl.currentPage == 3{
            println("last page")
            
            UIView.animateWithDuration(0.3, animations: {
                self.ctaView.alpha = 1
            })
        }
        else{
            
            UIView.animateWithDuration(0.3, animations: {
                self.ctaView.alpha = 0
            })
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
