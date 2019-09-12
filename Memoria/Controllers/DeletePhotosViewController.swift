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
import FontAwesome_swift


class DeletePhotosViewController: UIViewController {
    
    @IBOutlet weak var backGroundView2: UIImageView!
    @IBOutlet weak var kolodaView: KolodaView!
    var album: Album! = nil
    
    let photoService = PhotoService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setSwipeBack()

        // Do any additional setup after loading the view.
//        allDelete.font = UIFont.fontAwesome(ofSize: 40, style: .solid)
//        allDelete.text = String.fontAwesomeIcon(name: .trash)
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }
    
    @IBAction func didClickStay(_ sender: UIButton) {
        kolodaView.swipe(.right)
    }
    @IBAction func didClickDelete(_ sender: UIButton) {
        photoService.deletePhotos(deletePhotos: [album.photos[kolodaView.currentCardIndex]])
        kolodaView.swipe(.left)
    }
    @IBAction func didClickBack(_ sender: UIButton) {
        kolodaView.revertAction()
    }
    @IBAction func didClickAllDelete(_ sender: UIButton) {
       photoService.deletePhotos(deletePhotos: [album.photos[kolodaView.currentCardIndex]])
        kolodaView.swipe(.left)
    }
    
    //左にスワイプしたら削除にしたい
    @IBAction func didSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        photoService.deletePhotos(deletePhotos: [album.photos[kolodaView.currentCardIndex]])
        kolodaView.swipe(.left)
    }
    //上にスワイプしたら１枚もどる
    @IBAction func didClickUp(_ sender: UISwipeGestureRecognizer) {
        kolodaView.revertAction()   
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
    
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left, .right, .up, .down]
    }
    
}
//
//func deletePhotos(deletePhotos: [PHAsset], completion: @escaping () -> Void) {
//    PHPhotoLibrary.shared().performChanges({ () -> Void in
//        // 削除などの変更はこのblocks内でリクエストする
//        PHAssetChangeRequest.deleteAssets(deletePhotos as NSFastEnumeration)
//    }, completionHandler: { (success, error) -> Void in
//        // 完了時の処理をここに記述
//        //            for deletePhoto in deletePhotos {
//        //                self.deletePhotosFromRealm(localIdentifier: deletePhoto.localIdentifier)
//        //            }
//        completion()
//    })
//}


// 必要なかったけどスワイプして１つ前の画面に戻るやつ
//extension DeletePhotosViewController {
//    func setSwipeBack() {
//        let target = self.navigationController?.value(forKey: "_cachedInteractionController")
//        let recognizer = UIPanGestureRecognizer(target: target, action: Selector(("handNavigationTransition:")))
//        self.view.addGestureRecognizer(recognizer)
//    }
//
//}
