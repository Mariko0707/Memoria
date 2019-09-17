//
//  DeletePhotoAllViewController.swift
//  Memoria
//
//  Created by Suzuki Mariko on 17/09/2019.
//  Copyright © 2019 Mariko. All rights reserved.
//

import UIKit
import Photos

class DeletePhotoAllViewController: UIViewController {

    var album: Album! = nil
    
    var result: [Date: [PHAsset]] = [:]
    
    var dateOrder = [Date]()
    
    lazy var dateformatter: DateFormatter = {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy/MM/dd"
        return dateformatter
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        let calendar = Calendar.current
        
        result = Dictionary(grouping: album.photos) { photo -> Date in
            return roundDate(photo.creationDate!, calendar: calendar)
            }.reduce(into: [Date: [PHAsset]]()) {dic, tuple in
                dic[tuple.key] = tuple.value
        }
        
        dateOrder = Array(result.keys).sorted { $0 < $1 }
    }
    
    // Dateから年日月を抽出する関数
    func roundDate(_ date: Date, calendar cal: Calendar) -> Date {
        return cal.date(from: DateComponents(year: cal.component(.year, from: date), month: cal.component(.month, from: date), day: cal.component(.day, from: date)))!
    }
}

extension DeletePhotoAllViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result[dateOrder[section]]!.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        
        manager.requestImageData(for: result[dateOrder[indexPath.section]]![indexPath.row], options: option) { (imageData, dataUTI, orientation, info) -> Void in
            
            if imageData != nil {
                thumbnail = UIImage(data: imageData!)!
            }
        }
        
        imageView.image = thumbnail
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        //ヘッダーの場合
        let testSection = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        
        let label = testSection.viewWithTag(1) as! UILabel
        label.text = dateformatter.string(from: dateOrder[indexPath.section])
        
        return testSection
        
        
    }
}
