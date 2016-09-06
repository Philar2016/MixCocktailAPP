//
//  MainViewController.swift
//  MixCocktail
//
//  Created by LiangMinglong on 26/08/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, BWWalkthroughViewControllerDelegate {
    
    var needWalkthrough:Bool = true
    var walkthrough:BWWalkthroughViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if needWalkthrough {
            self.presentWalkthrough()
        }
    }
    
    
    @IBAction func presentWalkthrough() {
        let stb = UIStoryboard(name: "Main", bundle: nil)
        self.walkthrough = stb.instantiateViewControllerWithIdentifier("container") as! BWWalkthroughViewController
        let page_one = stb.instantiateViewControllerWithIdentifier("page1")
        let page_two = stb.instantiateViewControllerWithIdentifier("page2")
       
        // Attach the pages to the master
        self.walkthrough.delegate = self
        self.walkthrough.addViewController(page_one)
        self.walkthrough.addViewController(page_two)
        
        self.presentViewController(walkthrough, animated: true) {
            ()->() in
            self.needWalkthrough = false
        }
    }
}


extension MainViewController{
    
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func walkthroughPageDidChange(pageNumber: Int) {

        if (self.walkthrough.numberOfPages - 1) == pageNumber{
            self.walkthrough.closeButton?.hidden = false
        }else{
            self.walkthrough.closeButton?.hidden = true
        }
  }
}