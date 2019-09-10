//
//  DeletePhotosViewController.swift
//  Memoria
//
//  Created by Suzuki Mariko on 26/08/2019.
//  Copyright © 2019 Mariko. All rights reserved.................................................................................................................
//

import UIKit
import Koloda
import Photos

class DeletePhotosViewController: UIViewController {
    
    @IBOutlet weak var kolodaView: KolodaView!
    var album: Album! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }
    
    @IBAction func didClickStay(_ sender: UIButton) {
    }
    @IBAction func didClickDelete(_ sender: UIButton) {
    }
    @IBAction func didClickBack(_ sender: UIButton) {
    }
    
}


//extension DeletePhotosViewController: KolodaViewDelegate, KolodaViewDataSource {
//
//    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
//        return images.count
//    }
//
//    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
//        let photo = UIImage(named: images[index])
//        let photoView = UIImageView(image: photo)
//
//        return photoView
//    }
//
//}


extension DeletePhotosViewController: KolodaViewDelegate, KolodaViewDataSource {
    
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
    
    
    
    
}
