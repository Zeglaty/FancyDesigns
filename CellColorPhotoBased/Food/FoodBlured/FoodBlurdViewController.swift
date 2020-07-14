//
//  FoodBlurdViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/13/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class FoodBlurdViewController: UIViewController {
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - decleration
        
    var selectedTypeIndex = 3
    
    var foodTypesImagesNamesWihte = ["hamburger-W" , "ice-cream-W" , "hot-drink-W" , "rice-bowl-W"]
    var foodTypesImagesNamesBlack = ["hamburger-B" , "ice-cream-B" , "hot-drink-B" , "rice-bowl-B"]
        
   
    @IBOutlet weak var demerView: UIView!
    
    // Blur : base View
    @IBOutlet weak var burgerButtonView: UIView!
    @IBOutlet weak var iceCreemButtonView: UIView!
    @IBOutlet weak var hotDrinkButtonView: UIView!
    @IBOutlet weak var risButtonView: UIView!
    var foodTypeViews = [UIView]()
    
    // BC views : is a view that torels between Black and Clear color
    @IBOutlet weak var burgerButtonBCView: UIView!
    @IBOutlet weak var iceCreemButtonBCView: UIView!
    @IBOutlet weak var hotDrinkButtonBCView: UIView!
    @IBOutlet weak var risButtonBCView: UIView!
    var foodTypeBCViews = [UIView]()
    
    @IBOutlet weak var bergerButton: UIButton!
    @IBOutlet weak var iceCreemButton: UIButton!
    @IBOutlet weak var hotDrinkButton: UIButton!
    @IBOutlet weak var risButton: UIButton!
    var foodTypeButtons = [UIButton]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var eggCard: UIView!
    
    @IBOutlet weak var blackBar: UIView!
    @IBOutlet weak var homeView: UIView!
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
       // MARK: - loding View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupViewStyle()
        
        // Do any additional setup after loading the view.
    }
    

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
    @IBAction func selectFoodType(_ sender: UIButton) {
        
        selectedTypeIndex = sender.tag
        
        for index in 0..<foodTypeViews.count{
            
            if index == selectedTypeIndex{
                //make it black
                foodTypeButtons[index].setImage(UIImage(named: foodTypesImagesNamesWihte[index]), for: .normal)
                foodTypeBCViews[index].backgroundColor = .black
            }else{
                // make it blured
                foodTypeButtons[index].setImage(UIImage(named: foodTypesImagesNamesBlack[index]), for: .normal)
                foodTypeBCViews[index].backgroundColor = .clear
                
            }
            
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Methods
        
    
    
    
        
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Setup View
    func setupData(){
        foodTypeViews = [burgerButtonView , iceCreemButtonView , hotDrinkButtonView , risButtonView]
        foodTypeBCViews = [burgerButtonBCView , iceCreemButtonBCView , hotDrinkButtonBCView , risButtonBCView]
        foodTypeButtons = [bergerButton , iceCreemButton , hotDrinkButton , risButton]
    }
    func setupViewStyle(){
        
//        searchButton.layer.masksToBounds = true
//        searchButton.layer.cornerRadius = searchButton.bounds.width / 2
        
//        blur(view: demerView)
        demerView.blur()
        
        preperingFoodTypesStyle()
        
        collectionView.backgroundColor = .clear
        
        eggCard.layer.masksToBounds = true
        eggCard.layer.cornerRadius = 30
//        blur(view: eggCard)
        eggCard.blur()
        
        blackBar.layer.masksToBounds = true
        blackBar.layer.cornerRadius = 30
        
        homeView.layer.masksToBounds = true
        homeView.layer.cornerRadius = homeView.frame.height/2
        
    }


    func loadActions(_ atMethod : LoadingViewTypes = .willAppear){
        switch atMethod {
        case .willAppear:
            break
            //do nothing
        case .didLoad:
            break
        case .didAppear:
            break
        case .willDisapear:
            break
        }
    }
    
    
//---------------
    func preperingFoodTypesStyle(){
       for index in 0..<foodTypeViews.count{
            foodTypeViews[index].layer.masksToBounds = true
            foodTypeViews[index].layer.cornerRadius = 13
            foodTypeBCViews[index].layer.masksToBounds = true
            foodTypeBCViews[index].layer.cornerRadius = 13
            
            foodTypeViews[index].addShadow()
            foodTypeViews[index].blur()
//             blur(view: foodTypeViews[index])
        
            
            
            if index == selectedTypeIndex{
                //make it black
                foodTypeButtons[index].setImage(UIImage(named: foodTypesImagesNamesWihte[index]), for: .normal)
                foodTypeBCViews[index].backgroundColor = .black
            }else{
                // make it blured
                foodTypeButtons[index].setImage(UIImage(named: foodTypesImagesNamesBlack[index]), for: .normal)
                foodTypeBCViews[index].backgroundColor = .clear
               
            }
            
        }
    }
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Navegation
        /*

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Extensions



// MARK: - 1 Collection View
extension FoodBlurdViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BluredPlateCollectionViewCell", for: indexPath) as! BluredPlateCollectionViewCell
                cell.makeCard()
        cell.blured = true
        
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "details", sender: nil)
    }
    
    
}

extension UIView{
    func blur(){
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = self.bounds
        
        visualEffectView.layer.masksToBounds = true
        visualEffectView.layer.cornerRadius = self.layer.cornerRadius
        
        self.insertSubview(visualEffectView, at: 0)
    }
}


    //////////////////////////////////////////////////////////////////////////////////
    // MARK: - NetWorkig
