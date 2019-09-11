//
//  ThrowBackViewController.swift
//  Memoria
//
//  Created by yonekan on 2019/09/06.
//  Copyright © 2019 Mariko. All rights reserved.
//

import UIKit
import Koloda
import Photos

class ThrowBackViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    
    var album: Album! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kolodaView.dataSource = self
        kolodaView.delegate = self
        
    }
    
}

extension ThrowBackViewController: KolodaViewDelegate, KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return album.photos.count
    }
    
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        
        manager.requestImageData(for: album.photos[index], options: option) { (imageData, dataUTI, orientation, info) -> Void in
            
            if imageData != nil {
                thumbnail = UIImage(data: imageData!)!
            }
        }
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = thumbnail
        return imageView
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left, .right, .up, .down]
    }
    
    
}
