//
//  BluredDetailsViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/13/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class BluredDetailsViewController: UIViewController {
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - decleration
        
        
        
        
  
    @IBOutlet weak var blurView: UIView!
    
    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var plusView: UIView!
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // MARK: - loding View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewStyle()
        // Do any additional setup after loading the view.
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
        
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Methods
        
        
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Setup View
    func setupData(){
        
    }
    func setupViewStyle(){
//        blur(view: blurView)
        blurView.blur()
        
        
        heartView.layer.masksToBounds = true
        heartView.layer.cornerRadius = heartView.frame.height/2
//        blur(view: heartView)
        heartView.blur()
        
        plusView.layer.masksToBounds = true
        plusView.layer.cornerRadius = plusView.frame.height/2
        
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
