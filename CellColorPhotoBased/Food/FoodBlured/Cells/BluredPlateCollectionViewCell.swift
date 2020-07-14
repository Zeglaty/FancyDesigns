//
//  BluredPlateCollectionViewCell.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/13/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class BluredPlateCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mealImage: UIImageView!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var heartView: UIView!
    
    var blured = false
    
    func makeCard(){
        if !blured{
            mealImage.layer.masksToBounds = true
            mealImage.layer.cornerRadius = mealImage.bounds.width / 2
            mealImage.addShadow()
            
            cardView.layer.masksToBounds = true
            cardView.layer.cornerRadius = 24
            cardView.addShadow()
            blur(view: cardView)
            
            heartView.layer.masksToBounds = true
            heartView.layer.cornerRadius = heartView.bounds.width / 2
            blur(view: heartView)
        }
        
    }
    
    
    
}



// MARK: - Blur
extension BluredPlateCollectionViewCell{
    func blur(view : UIView){
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = view.bounds
        
        visualEffectView.layer.masksToBounds = true
        visualEffectView.layer.cornerRadius = view.layer.cornerRadius
        
        view.insertSubview(visualEffectView, at: 0)
    }
}
