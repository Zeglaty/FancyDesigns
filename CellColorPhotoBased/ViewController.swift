//
//  ViewController.swift
//  CellColorPhotoBased
//
//  Created by AbdalmagidNew on 7/9/20.
//  Copyright © 2020 AbdalmagidNew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var avgColorView: UIView!
    
    @IBOutlet weak var pageControler: UIPageControl!
    @IBOutlet weak var pageView: UIView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    
    let colorY = UIColor(named: "ColorY")
    let colorG = UIColor(named: "ColorG")
    let colorB = UIColor(named: "ColorB")
    let colorR = UIColor(named: "ColorR")
    
    let images = ["img1", "img2","img3","img4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageColor = self.image.image?.averageColor{
            decidePhotoBackGroundColor(photoAvgColor: imageColor)
        }
        style()
        
//        let firstColor = UIColor(cgColor: CGColor(srgbRed: 0.51, green: 0.6, blue: 0.69, alpha: 1.0))
//        let secondColor = UIColor(cgColor: CGColor(srgbRed: 0.40, green: 0.6, blue: 0.69, alpha: 1.0))
//
//        print(firstColor.colorSimilarity(photoColor: secondColor))
        // Do any additional setup after loading the view.
    }
    @IBAction func stepper(_ sender: UIStepper) {
        countLabel.text = String(Int(sender.value))
        if sender.value < 4{
            self.image.image = UIImage(named: images[Int(sender.value)])
            pageControler.currentPage = Int(sender.value)
        }
        
        if let imageColor = self.image.image?.averageColor{
            decidePhotoBackGroundColor(photoAvgColor: imageColor)
        }
    }
    
    
    func style(){
        pageView.layer.masksToBounds = true
        pageView.layer.cornerRadius = pageView.bounds.height / 2
        
        avgColorView.layer.masksToBounds = true
        avgColorView.layer.cornerRadius = avgColorView.bounds.height / 2
        
        imageBackgroundView.layer.masksToBounds = true
        imageBackgroundView.layer.cornerRadius = 40
    }
    
    
    
    func decidePhotoBackGroundColor(photoAvgColor : UIColor){
        avgColorView.backgroundColor = photoAvgColor
        
        var simularityResults = [Float]()
        
        simularityResults.append(photoAvgColor.colorSimilarity(photoColor: colorY!))
        simularityResults.append(photoAvgColor.colorSimilarity(photoColor: colorG!))
        simularityResults.append(0.0)//photoAvgColor.colorSimilarity(photoColor: colorB!))
        simularityResults.append(photoAvgColor.colorSimilarity(photoColor: colorR!))
        
        print("//////////simularityResults :")
        print(simularityResults)
        var mostSimularColorIndex = 0
        
        for index in 0..<simularityResults.count{
            if simularityResults[mostSimularColorIndex] < simularityResults[index]{
                mostSimularColorIndex = index
            }
           
        }
        
        
        switch mostSimularColorIndex {
        case 0:
            imageBackgroundView.backgroundColor = colorY!
         
        case 1:
            imageBackgroundView.backgroundColor = colorG!
        
        case 2:
            imageBackgroundView.backgroundColor = colorB!
            
        case 3:
            imageBackgroundView.backgroundColor = colorR!
            
        default:
            imageBackgroundView.backgroundColor = .blue
        }
        
        
        
    }
    
    


}




// MARK: - Extentions

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        let calculatedColor = UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
        
        
        
        
        
        
        
        
        return calculatedColor
    }
    
    
 
    
    
    
    
}


extension UIColor {

    
    func colorSimilarity (photoColor: UIColor) -> Float {
        var r1: CGFloat = 0
        var g1: CGFloat = 0
        var b1: CGFloat = 0
        var a1: CGFloat = 0
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        var r2: CGFloat = 0
        var g2: CGFloat = 0
        var b2: CGFloat = 0
        var a2: CGFloat = 0
        photoColor.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    //    r1 == r2 && g1 == g2 && b1 == b2 && a1 == a2
        
        let avgR = (r2 / r1) * 100
        let avgG = (g2 / g1) * 100
        let avgB = (b2 / b1) * 100
        let avgA = (a2 / a1) * 100
        
        
        let similarityAvg = ( avgR + avgG + avgB ) / 3
        print("\(avgR) , \(avgG) , \(avgB) = \(similarityAvg) " )
        
        
        return Float(similarityAvg)
      }
    
    
    
}

