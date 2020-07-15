//
//  ToastViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/15/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class ToastViewController: UIViewController {

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - decleration
        
        
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var viewToastButton: UIButton!
    @IBOutlet weak var viewControllerButton: UIButton!
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - loding View Methods

        // override func viewWillAppear
        override func viewDidLoad() {
            super.viewDidLoad()
            setupViewStyle()
            // Do any additional setup after loading the view.
        }
        
        // override func viewDidAppear
        
        // override func willDisapear
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
    @IBAction func showViewToast(_ sender: Any) {
        
        redView.showToast(nil, "somthing in a view", Error: false, doDismition: true)
    }
    
        
    @IBAction func showVCToast(_ sender: Any) {
        self.showToast("somthing in a VC", Error: false, doDismition: true)
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Methods
        
        
        
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Setup View
    func setupData(){
        
        
    }
    func setupViewStyle(){
        viewToastButton.layer.masksToBounds = true
        viewToastButton.layer.cornerRadius = viewToastButton.frame.height/4
        
        viewControllerButton.layer.masksToBounds = true
        viewControllerButton.layer.cornerRadius = viewControllerButton.frame.height/4
        
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
extension UIViewController{
    func showToast(_ message : String, Error :Bool, doDismition : Bool = false){
        let viewController = self
        let view = self.view
        
        view?.showToast(viewController, message, Error: Error,doDismition: doDismition)
    }
}



//MARK: - 6.1 Show Toast Message
extension  UIView{
    
    func showToast(_ viewController : UIViewController?, _ message : String, Error :Bool, doDismition : Bool = false) { //, font: UIFont

        let toastLabel = UILabel(frame: CGRect(x: 16, y: (self.frame.size.height * 0.85), width: self.frame.size.width - 32, height: 48))
                            
            // Label Attreputes
            toastLabel.font = UIFont(name: "Tajawal-Medium", size: 14) ?? UIFont.boldSystemFont(ofSize: 14)
            toastLabel.textColor = .white//ColorTheme.toastTextColor
            toastLabel.backgroundColor = .systemIndigo//ColorTheme.toastColor.withAlphaComponent(1.0)
            
            toastLabel.adjustsFontSizeToFitWidth = true
            toastLabel.textAlignment = .right;
            toastLabel.text = "     " + message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 4;
            toastLabel.clipsToBounds  =  true
            toastLabel.translatesAutoresizingMaskIntoConstraints = false

            self.addSubview(toastLabel)
            
            // Constraints
            toastLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
            toastLabel.widthAnchor.constraint(equalToConstant: self.frame.size.width - 32).isActive = true
            toastLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
            toastLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // Code you want to be delayed
                UIView.animate(withDuration: 1.0, delay: 0.1, options: .curveEaseOut, animations: {
                    toastLabel.alpha = 0.0
                }, completion: {(isCompleted) in
                    if viewController != nil && doDismition{
                        //Dismiss
                        if (viewController?.navigationController != nil){
                            _ = viewController?.navigationController?.popViewController(animated: true)
                        }else{
                            viewController!.dismiss(animated: true, completion: nil)
                        }
                        
                    }
                    toastLabel.removeFromSuperview()
                })
            }

    }
    
}


    //////////////////////////////////////////////////////////////////////////////////
    // MARK: - NetWorkig


