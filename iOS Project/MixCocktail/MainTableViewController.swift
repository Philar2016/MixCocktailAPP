//
//  MainTableViewController.swift
//  MixCocktail
//
//  Created by LiangMinglong on 29/08/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//

import UIKit
import LeanCloud


class MainTableViewController: UITableViewController{
    
    //定义一个cocktail的数组
    var cocktailRecipe = Array<LCObject>()

        
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var cocktailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //menu按钮的侧滑页
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        
        //数据库 leancloud查询
        let query = LCQuery(className: "CocktailRecipe")
            // 执行查找
             query.find({ (result) in
             if(result.isSuccess){
             // 获取 cocktailRecipe 数组
             self.cocktailRecipe = result.objects!
                print("array = \(self.cocktailRecipe.count)")
                //刷新表格
                self.cocktailTableView.reloadData()
             }
        })
        
    }
    
    
    //在tableView里显示数据库里存储的数据。。
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cocktailRecipe.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //定义一个cell,让它属于cocktailCell
        let cell = tableView.dequeueReusableCellWithIdentifier("cocktailCell", forIndexPath: indexPath) as! cocktailCell
        //获取数组中存储的值
        let thisCocktail = self.cocktailRecipe[indexPath.row]
        let cocktailname: LCString! = thisCocktail.get("CocktailName")
        let cocktailtime: LCString! = thisCocktail.get("CocktailTimer")
        let cocktailingredient: LCString! = thisCocktail.get("CocktailIngredient")
        
        
        let mainimage: LCDictionary! = thisCocktail.get("MainImage")
        let mainimageurl: LCString! = mainimage.value["url"] as! LCString
        
        print("当前数据行=\(indexPath.row) \(cocktailname.value)")
        print("当前数据行=\(indexPath.row) \(cocktailtime.value)")
        print("当前数据行=\(indexPath.row) \(cocktailingredient.value)")
        print("当前数据行=\(indexPath.row) \(mainimageurl.value)")
        
        //显示到cell上面
        cell.cocktailName.text = "\(cocktailname.value)"
        cell.cocktailTimer.text = "\(cocktailtime.value)"
        cell.cocktailIngredient.text = "\(cocktailingredient.value)"
        cell.mainImageView.sd_setImageWithURL(NSURL(string:mainimageurl.value), placeholderImage: nil)
        
        //读取视图中的cell
        return cell
        
    }
    
    
    // 从mainTableViewController传值Segue到DetailViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailViewController" {
            
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPathForCell(cell)
            let detailViewController = segue.destinationViewController as! DetailViewController
            //索引是哪个,数组应该是哪个数据
            let thisCocktail = self.cocktailRecipe[indexPath!.row]
            print("用户选择的索引是=\(indexPath?.row)")
            
            //定义一个叫detailInfo的变量， 他的值等于＝选中的那一个cocktail里从leancloud的DetailInformation里的数据.
            let detailInfo: LCString! = thisCocktail.get("DetailInformation")
            
            //下一个明细页面的变量selectedUrl=这个detailInfo的值value。
            detailViewController.detailUrl = detailInfo.value
        }

    
}

}
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()





    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
