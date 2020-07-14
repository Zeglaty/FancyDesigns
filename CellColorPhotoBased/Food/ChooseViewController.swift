//
//  ChooseViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/14/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - decleration
        
        
        
        
    
    @IBOutlet weak var bluredCardView: UIView!
    @IBOutlet weak var grayCardView: UIView!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var dotView: UIView!
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - loding View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewStyle()
        // Do any additional setup after loading the view.
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
    @IBAction func blurMode(_ sender: Any) {
        performSegue(withIdentifier: "blur", sender: nil)
    }
    
    @IBAction func grayMode(_ sender: Any) {
        performSegue(withIdentifier: "gray", sender: nil)
    }
   
    @IBAction func record(_ sender: Any) {
        performSegue(withIdentifier: "record", sender: nil)
    }
    
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Methods
        
        
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Setup View
    func setupData(){
        
    }
    func setupViewStyle(){
        
        bluredCardView.layer.masksToBounds = true
        bluredCardView.layer.cornerRadius = 30
//        blur(view: bluredCardView)
        bluredCardView.blur()
        bluredCardView.addShadow()
        
        grayCardView.layer.masksToBounds = true
        grayCardView.layer.cornerRadius = 30
        grayCardView.addShadow()
        
        recordButton.layer.masksToBounds = true
        recordButton.layer.cornerRadius = recordButton.frame.height/4
        
        dotView.layer.masksToBounds = true
        dotView.layer.cornerRadius = dotView.frame.height/2
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

