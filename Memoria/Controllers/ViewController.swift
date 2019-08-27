//
//  ViewController.swift
//  Memoria
//
//  Created by Suzuki Mariko on 19/08/2019.
//  Copyright © 2019 Mariko. All rights reserved.
//

import UIKit
// スプラッシュ
import RevealingSplashView

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
// スプラッシュ終わり


class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // スプラッシュ系
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "splash")!,iconInitialSize: CGSize(width: 200, height: 200), backgroundColor: UIColor .white)
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.animationType = SplashAnimationType.swingAndZoomOut
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
        let LogoImage = UIImage (named: "logo")
        imageView.image = LogoImage
        // ここまで
        
    }
    // ボタンからの画面遷移
    @IBAction func didClickButtonforTB(_ sender: UIButton) {
        performSegue(withIdentifier: "toTB", sender: nil)
    }
    @IBAction func didClickButtontoDeletePics(_ sender: UIButton) {
        performSegue(withIdentifier: "toDeletePhoto", sender: nil)
    }
    
    

}

