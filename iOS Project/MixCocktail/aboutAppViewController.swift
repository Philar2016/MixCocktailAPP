//
//  aboutAppViewController.swift
//  MixCocktail
//
//  Created by LiangMinglong on 30/08/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//

import UIKit

class aboutAppViewController: UIViewController {

    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            MenuButton.target = self.revealViewController()
            MenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
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

}