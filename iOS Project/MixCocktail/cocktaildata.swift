//
//  cocktaildata.swift
//  MixCocktail
//
//  Created by LiangMinglong on 1/09/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//


import UIKit
import LeanCloud

protocol cocktailDataDelegate: NSObjectProtocol {
    
    func gotcocktail(cocktail: NSArray)
}

class cocktailData: NSObject {
    
    var delegate: cocktailDataDelegate?
    
    override init() {
        super.init()
    }
    
    func getCocktail(search_string:String){
        
        var result_array:NSArray = []
        
        let query = LCQuery(className: "CocktailRecipe")
        query.whereKey("CocktailName", LCQuery.Constraint.EqualTo(value: LCUser.current!))
        
        if search_string.characters.count > 0 {
            query.whereKey("CocktailName", LCQuery.Constraint.MatchedSubstring(string: search_string))
        }
        // 执行查找
        query.find({ (result) in
            if(result.isSuccess){
                result_array = result.objects!
                self.delegate?.gotcocktail(result_array)
               
            }
        })
    }
    
}

