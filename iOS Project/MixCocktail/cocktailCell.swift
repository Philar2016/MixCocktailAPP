//
//  CocktailCell.swift
//  MixCocktail
//
//  Created by LiangMinglong on 30/08/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//


import UIKit

class cocktailCell: UITableViewCell {
    
  
    @IBOutlet weak var cocktailName: UILabel!
    @IBOutlet weak var cocktailTimer: UILabel!
    @IBOutlet weak var cocktailIngredient: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}