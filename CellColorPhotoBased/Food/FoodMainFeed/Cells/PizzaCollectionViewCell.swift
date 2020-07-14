//
//  PizzaCollectionViewCell.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/12/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class PizzaCollectionViewCell: UICollectionViewCell, RotationProtocol {
    
    
    
    @IBOutlet weak var caloriesNumberLabel: UILabel!
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var discreptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    let foodVC = FoodViewController()
    
    func makeCard(){
        
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 8
        
        foodVC.rotationDeleget = self
        reloadCollectionViewCellWithAnimation(collectionViewCell: self)
    }
    
    
 func rotateAnimation() {
     DispatchQueue.main.async {
         UIView.animate(withDuration: 1.0, animations: { () -> Void in
             self.pizzaImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }) { (succeed) -> Void in

        }
     }
 }
    
    
    
    func R(){
        
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                self.pizzaImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
           }) { (succeed) -> Void in

           }
        }
        
        
    }
    
    func reloadCollectionViewCellWithAnimation(collectionViewCell : UICollectionViewCell){
        
        UIView.transition(with: collectionViewCell,
                          duration: 0.6,//0.35,
                        options: .transitionFlipFromLeft,
            animations: {  })
    }
    
    
}
