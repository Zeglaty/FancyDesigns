//
//  FoodViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/12/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit
import Foundation

enum LoadingViewTypes {
    case willAppear
    case didLoad
    case didAppear
    case willDisapear
}




class FoodViewController: UIViewController {
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - decleration
    var sectionWidth : CGFloat?
    var sectionIndicatorViewWidth : CGFloat?
    var selectedCategory = 0
    var currentCategory = 0
    
    var contentOffset: CGFloat = 0
    var rotationDeleget : RotationProtocol?
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var popularButton: UIButton!
    @IBOutlet weak var pizzaButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var allMenuButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    
    var sectionButtons = [UIButton]()
    
    
    
    @IBOutlet weak var sectionIndicatorView: UIView!
    @IBOutlet weak var sectionIndicatorViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var sectionIndicatorViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var sectionIndIcatorBackgroundView: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var locationCardView: UIView!
    @IBOutlet weak var locationCardViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var locationCardViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var locationCardViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var locationCardViewRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var locationCardViewHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var editButtonRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var locationImage: UIImageView!
    
    
    
    

    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - loding View Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        setupData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewStyle()

        
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
    @IBAction func selectingCategory(_ sender: UIButton) {
        selectedCategory = sender.tag
        
        if selectedCategory > currentCategory{
            sectionIndecatorForwordAnimate()
            
        }else if selectedCategory < currentCategory{
            sectionIndecatorBackwordAnimate()
        }
        
        
        selectingSectionEffect(withTag: sender.tag)
        collectionView.reloadData()
//        reloadCollectionViewWithAnimation(collectionView: collectionView)
        
        
    }
    
    @IBAction func Edit(_ sender: Any) {
        expandEditLocationCard()
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Methods
    func selectingSectionEffect(withTag tag: Int){
        for button in sectionButtons{
            if button.tag == tag{
                button.titleLabel?.font = button.titleLabel?.font.withSize(17.0)
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.adjustsFontSizeToFitWidth = true
                
            }else{
                button.titleLabel?.font = button.titleLabel?.font.withSize(14.0)
                button.setTitleColor(UIColor.systemGray3, for: .normal)
            }
        }
    }
    

      
//---------------
    func R(pizzaImageView : UIImageView){
        
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                pizzaImageView.transform = CGAffineTransform(rotationAngle: CGFloat(180 * M_PI))
           }) { (succeed) -> Void in

           }
        }
        
        
    }
    
//-------------
    func reloadCollectionViewWithAnimation(collectionView : UICollectionView){
        
//        UIView.transition(with: collectionView,
//        duration: 0.35,
//        options: .transitionFlipFromLeft,
//        animations: { collectionView.reloadData() })
    }
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Setup View
    func setupData(){
        
        sectionButtons = [popularButton , pizzaButton , topButton , allMenuButton , foodButton]
        
        sectionWidth = sectionIndIcatorBackgroundView.frame.width/5
        sectionIndicatorViewWidth = sectionIndicatorView.frame.width
        
        
        sectionIndicatorViewLeftConstraint.constant = ((sectionWidth!/2) - (sectionIndicatorViewWidth!/2)) + (sectionWidth! * CGFloat(selectedCategory)) - 10
        
        
        
        
    }
    func setupViewStyle(){
        searchButton.layer.masksToBounds = true
        searchButton.layer.cornerRadius = searchButton.bounds.width / 2
        searchButton.addShadow()
        
        sectionIndicatorView.layer.masksToBounds = true
        sectionIndicatorView.layer.cornerRadius = 3
        
        sectionIndIcatorBackgroundView.backgroundColor = .clear
        
        locationCardView.layer.masksToBounds = true
        locationCardView.layer.cornerRadius = 8
        
        editButton.layer.masksToBounds = true
        editButton.layer.cornerRadius = editButton.bounds.width / 2
        editButton.addShadow()
        
        locationImage.layer.masksToBounds = true
        locationImage.layer.cornerRadius = locationImage.bounds.width / 2
        
        if locationCardViewTopConstraint.constant < 16{
            let calcoulatedHeight = locationCardViewHeightConstraint.constant - (locationCardViewTopConstraint.constant - 16 )
            if calcoulatedHeight < 140.0{
                locationCardViewHeightConstraint.constant = 140
            }else{
                locationCardViewHeightConstraint.constant = calcoulatedHeight
            }
        }
        
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



// MARK: - 1 CollectionView
extension FoodViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PizzaCollectionViewCell", for: indexPath) as! PizzaCollectionViewCell
        cell.makeCard()
//        cell.pizzaImage.rotate()
        R(pizzaImageView: cell.pizzaImage)
        cell.R()
            // Configure the cell
        
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Details", sender: nil)
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if contentOffset > scrollView.contentOffset.x {
       // scrolling up
            rotationDeleget?.rotateAnimation()
            print("scrolling forword")
       } else if contentOffset < scrollView.contentOffset.x {
       //scrolling Down
            rotationDeleget?.rotateAnimation()
            print("scrolling bacword")
       }
        contentOffset = scrollView.contentOffset.y
    }

    
    
}


// MARK: - 2 rotate View
extension UIView{
    // --------------
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = false
        

    }
    
    
    
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi/2)
        rotation.duration = 0.5
//        rotation.isCumulative = true
//        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

// MARK: - 2.3 present
extension UIViewController{
 
    func presentEditLocationScreen(){

        guard let reactionVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EditLocationViewController") as? EditLocationViewController else {
                assertionFailure("No view controller ID ReactionViewController in storyboard")
                return
            }
             reactionVC.modalPresentationStyle = .fullScreen
            self.present(reactionVC, animated: false, completion: nil)
        }
    
   
    
}

// MARK: - 2.4 view Border
extension CALayer {
 func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
  let border = CALayer()
  switch edge {
  case .top:
    border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
    break
  case .bottom:
    border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
    break
  case .left:
    border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
    break
  case .right:
    border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
    break
  default:
    break
  }
  border.backgroundColor = color.cgColor;
  addSublayer(border)
 }
}




    //////////////////////////////////////////////////////////////////////////////////
    // MARK: - NetWorkig




// MARK: - rotationProtocol
protocol RotationProtocol {
    func rotateAnimation()
}

