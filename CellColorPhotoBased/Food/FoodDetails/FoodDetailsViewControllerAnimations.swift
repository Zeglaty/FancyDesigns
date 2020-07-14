//
//  FoodDetailsViewControllerAnimations.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/13/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import Foundation
import UIKit


extension FoodDetailsViewController {
    
    
    
    func scalePlateViewAnimation(senderTag : Int){
        switch senderTag {
        case 0:
            // scale to small
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            
                UIView.animate(withDuration: 0.3, animations: {
                self.pizzaView.transform = CGAffineTransform(scaleX: 0.91, y: 0.91)
                self.pizzaImage.transform = self.pizzaImage.transform.rotated(by: CGFloat.pi/2)
                self.view.layoutIfNeeded()
                
                
                
            }, completion: nil)
            
            }
            
        
        case 1:
            // scale to mediam
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            
                UIView.animate(withDuration: 0.3, animations: {
                self.pizzaView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.pizzaImage.transform = self.pizzaImage.transform.rotated(by: CGFloat.pi/2)
                self.view.layoutIfNeeded()
            }, completion: nil)
                
            }
            
            
        case 2:
            // scale to larg
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            
                UIView.animate(withDuration: 0.3, animations: {
                self.pizzaView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.pizzaImage.transform = self.pizzaImage.transform.rotated(by: CGFloat.pi/2)
                self.view.layoutIfNeeded()
            }, completion: nil)
                
            }
            
            
        default:
            break
        }
    }
    
//-------------------
    
    func bouncUpdateLabel(label : UILabel ,newText text : String){
        
        label.text = text
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
        
            UIView.animate(withDuration: 0.4, animations: {
            label.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.view.layoutIfNeeded()
            
            }, completion: nil)
            
            
            UIView.animate(withDuration: 0.4,delay: 0.4 , animations: {
        label.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.view.layoutIfNeeded()
        
        }, completion: nil)
            
        UIView.animate(withDuration: 0.4,delay: 0.8, animations: {
        label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        self.view.layoutIfNeeded()
        
        }, completion: nil)
        
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
