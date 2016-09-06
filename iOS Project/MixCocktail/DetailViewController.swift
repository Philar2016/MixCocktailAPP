//
//  DetailViewController.swift
//  MixCocktail
//
//  Created by LiangMinglong on 1/09/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //定义一个selectedUrl的变量，等待接收从主页面传过来的值
    var detailUrl: String = ""
    
    @IBOutlet weak var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    //让变量url＝self.detailUrl的值
    let url = NSURL(string: self.detailUrl)
    //url请求的对象就是变量url
    let urlrequest = NSURLRequest(URL: url!)
      //加载url请求
      self.WebView.loadRequest(urlrequest)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
