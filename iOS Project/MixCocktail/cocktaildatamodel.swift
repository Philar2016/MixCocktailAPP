//
//  cocktaildatamodel.swift
//  MixCocktail
//
//  Created by LiangMinglong on 5/09/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//

import UIKit
import LeanCloud

protocol cocktailDataDelegate: NSObjectProtocol {
    
    func gotcocktail(password: NSArray)
}

class PasswordData: NSObject {
    
    var delegate: cocktailDataDelegate?
    
    override init() {
        super.init()
    }
    
    func getUserCocktail(search_string:String){
        
        var resultArray:NSArray = []
        
        let query = LCQuery(className: "CocktailRecipe")
        query.whereKey("CocktailName", LCQuery.Constraint.EqualTo(value: LCUser.current!))
        
        if search_string.characters.count > 0 {
            query.whereKey("CocktailName", LCQuery.Constraint.MatchedSubstring(string: search_string))
        }
        // 执行查找
        query.find({ (result) in
            if(result.isSuccess){
                resultArray = result.objects!
                self.delegate?.gotcocktail(resultArray)
              
            }
        })
    }
    
}

