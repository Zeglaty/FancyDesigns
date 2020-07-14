//
//  EditLocationViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/12/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class EditLocationViewController: UIViewController {

    @IBOutlet weak var CLOSEBUTTON: UIButton!
    @IBOutlet weak var locationImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewStyle()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupViewStyle(){
        
        
        CLOSEBUTTON.layer.masksToBounds = true
        CLOSEBUTTON.layer.cornerRadius = CLOSEBUTTON.bounds.width / 2
        CLOSEBUTTON.addShadow()
        
       locationImage.layer.masksToBounds = true
       locationImage.layer.cornerRadius = locationImage.bounds.width / 2
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
