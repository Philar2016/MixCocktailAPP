//
//  SearchTableViewController.swift
//  MixCocktail
//
//  Created by LiangMinglong on 5/09/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//

import UIKit
import LeanCloud

class SearchTableViewController: UITableViewController {

    @IBOutlet weak var searchbar: UISearchBar!
    
    @IBOutlet var cocktailTableView: UITableView!
    
    
    var cocktailRecipe = Array<LCObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return 1
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //返回.count
        return self.cocktailRecipe.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //定义一个cell,让它属于cocktailCell
        let cell = tableView.dequeueReusableCellWithIdentifier("searchcocktailcell", forIndexPath: indexPath) as! searchcocktailcell
        //获取数组中存储的值
        let searchCocktail = self.cocktailRecipe[indexPath.row]
        let cocktailname: LCString! = searchCocktail.get("CocktailName")
        print("当前数据行=\(indexPath.row) \(cocktailname.value)")
        //显示到cell上面
        cell.searchcocktailname.text = "\(cocktailname.value)"
        //读取视图中的cell
        return cell
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    //定义searchBar,当textDidChange的时候，触发这个查询。 变量有searchText 是string类型
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("输入的字符串 = \(searchBar.text)")
        //查询cocktailRecipe
        let query = LCQuery(className: "CocktailRecipe")
        //当searchText字符大于0的时候，查询cocktailName
        if searchText.characters.count > 0 {
            query.whereKey("CocktailName", LCQuery.Constraint.MatchedSubstring(string: searchText))
        }
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
    
    // 从searchTableViewController传值Segue到DetailViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         //定义这个segue
        if segue.identifier == "showbackDetailViewController" {
            
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