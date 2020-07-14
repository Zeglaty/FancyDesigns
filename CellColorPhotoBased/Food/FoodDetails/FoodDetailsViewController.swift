//
//  FoodDetailsViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/13/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class FoodDetailsViewController: UIViewController {
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - decleration
   var selectedSizeTag = 0
    let prices = ["$7,90" , "$12,50" , "$14,99"]
        
        
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var pizzaView: UIView!
    
    
    @IBOutlet weak var SSizeButton: UIButton!
    @IBOutlet weak var MSizeButton: UIButton!
    @IBOutlet weak var LSizeButton: UIButton!
    var sizeButtons = [UIButton]()
    
    @IBOutlet weak var marketView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
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
    @IBAction func resizing(_ sender: UIButton) {
        if selectedSizeTag != sender.tag{
            scalePlateViewAnimation(senderTag: sender.tag)
            updateButtonAppearence(senderTag: sender.tag)
            bouncUpdateLabel(label: priceLabel, newText: prices[sender.tag])
            
            selectedSizeTag = sender.tag

        }
        
        
                
        
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Methods
    
        
    func updateButtonAppearence(senderTag : Int){
        for button in sizeButtons{
            if button.tag == senderTag{
                button.setTitleColor(.label, for: .normal)
                button.backgroundColor = UIColor(named: "SelectedSizeColor")
            }else{
                button.setTitleColor(.systemGray3, for: .normal)
                button.backgroundColor = .systemGray6
            }
        }
    }
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Setup View
    func setupData(){
        sizeButtons = [SSizeButton , MSizeButton ,LSizeButton]
    }
    func setupViewStyle(){
        heartButton.layer.masksToBounds = true
        heartButton.layer.cornerRadius = heartButton.bounds.width / 2
        heartButton.addShadow()
        
        
        pizzaView.layer.masksToBounds = true
        pizzaView.layer.cornerRadius = pizzaView.bounds.width / 2
        pizzaView.addShadow()
        
        
        SSizeButton.layer.masksToBounds = true
        SSizeButton.layer.cornerRadius = SSizeButton.bounds.height / 2
        MSizeButton.layer.masksToBounds = true
        MSizeButton.layer.cornerRadius = MSizeButton.bounds.height / 2
        LSizeButton.layer.masksToBounds = true
        LSizeButton.layer.cornerRadius = LSizeButton.bounds.height / 2
        
        marketView.layer.masksToBounds = true
        marketView.layer.cornerRadius = marketView.bounds.height / 2
        
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




    //////////////////////////////////////////////////////////////////////////////////
    // MARK: - NetWorkig
