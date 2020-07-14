//
//  FoodViewControllerAnimations.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/12/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import Foundation
import UIKit
// MARK: - ANIMATIONS



// MARK: - Dot movement
extension FoodViewController{
    
    /*
    @IBOutlet weak var sectionIndicatorView: UIView!
    @IBOutlet weak var sectionIndicatorViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var sectionIndicatorViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var sectionIndIcatorBackgroundView: UIView!
    */
    func sectionIndecatorForwordAnimate() {
        let duration = 0.2
        
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {

        
             
               UIView.animate(withDuration: duration,
                            delay: 0,
                            animations: { [weak self] in
                                
                               
                               
                               self!.sectionIndicatorViewWidthConstraint.constant = self!.sectionWidth! * CGFloat(self!.selectedCategory - self!.currentCategory)
                                
                                self!.view.layoutIfNeeded()

             }, completion: nil)
             
             UIView.animate(withDuration: duration,
                            delay: duration,
                            animations: { [weak self] in
                                self!.sectionIndicatorViewLeftConstraint.constant = self!.sectionIndicatorViewLeftConstraint.constant + (CGFloat((self!.selectedCategory - self!.currentCategory)) * self!.sectionWidth!)
                                
                               self!.sectionIndicatorViewWidthConstraint.constant = 10.0
                                self!.view.layoutIfNeeded()
             }, completion: {(isCompleted) in
                self.currentCategory = self.selectedCategory
             })
             
        
        
        
    }
        
        
     
     
    }
    
    
    
    func sectionIndecatorBackwordAnimate() {
        
        let duration = 0.2
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {

        
             
               UIView.animate(withDuration: duration,
                            delay: 0,
                            animations: { [weak self] in
                                
                                self!.sectionIndicatorViewWidthConstraint.constant = self!.sectionWidth! * CGFloat(self!.currentCategory - self!.selectedCategory)
                                self!.sectionIndicatorViewLeftConstraint.constant =  self!.sectionIndicatorViewLeftConstraint.constant - (CGFloat((self!.currentCategory - self!.selectedCategory)) * self!.sectionWidth!)
                                 
                                 self!.view.layoutIfNeeded()
                               

             }, completion: nil)
             
             UIView.animate(withDuration: duration,
                            delay: duration,
                            animations: { [weak self] in
                                
                                self!.sectionIndicatorViewWidthConstraint.constant = 10.0
                                self!.view.layoutIfNeeded()
                                
                                
             }, completion: {(isCompleted) in
                self.currentCategory = self.selectedCategory
             })
             
        
        
        
    }
        
        
     
     
    }
    
    
}



// MARK: - Card Expand
extension FoodViewController{
    func expandEditLocationCard(){
        let originalBottomConstraint = self.locationCardViewBottomConstraint.constant
        let originalLeftConstraint = self.locationCardViewLeftConstraint.constant
        let originalRightConstraint = self.locationCardViewRightConstraint.constant
        let originalHeightConstraint = self.locationCardViewHeightConstraint.constant
        
        let originalEditButtonRightConstraint = self.editButtonRightConstraint.constant
        
        
        UIView.animate(withDuration: 0.7, delay: 0.0, animations: { //, options: UIView.AnimationOptions.curveEaseIn
            //Frame Option 1:
//            self.locationCardView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height:self.view.frame.height)
            
            
            
            self.locationCardViewBottomConstraint.constant = 0
            self.locationCardViewLeftConstraint.constant = 0
            self.locationCardViewRightConstraint.constant = 0
            self.locationCardViewHeightConstraint.constant = self.view.frame.height - 50
            
            self.editButtonRightConstraint.constant = 25
            self.view.layoutIfNeeded()
            

            },completion: {(isCompleted) in
                self.locationCardViewBottomConstraint.constant = originalBottomConstraint
                self.locationCardViewLeftConstraint.constant = originalLeftConstraint
                self.locationCardViewRightConstraint.constant = originalRightConstraint
                self.locationCardViewHeightConstraint.constant = originalHeightConstraint
                
                 self.editButtonRightConstraint.constant = originalEditButtonRightConstraint
                self.view.layoutIfNeeded()
                
                
                self.presentEditLocationScreen()
            
            })
        
        
   
         }
        
    }

