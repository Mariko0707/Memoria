//
//  ThrowBackPhotoAllViewController.swift
//  Memoria
//
//  Created by Suzuki Mariko on 17/09/2019.
//  Copyright © 2019 Mariko. All rights reserved.
//

import UIKit
import Photos

class ThrowBackPhotoAllViewController: UIViewController {

    
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
        
        album.photos = album.photos.sorted(by: { (asset1, asset2) -> Bool in
            return asset1.creationDate! < asset2.creationDate!
        })
        
        result = Dictionary(grouping: album.photos) { photo -> Date in
            return roundDate(photo.creationDate!, calendar: calendar)
            }.reduce(into: [Date: [PHAsset]]()) {dic, tuple in
                dic[tuple.key] = tuple.value
        }
        
        dateOrder = Array(result.keys).sorted { $0 < $1 }
    }
        
    
    func roundDate(_ date: Date, calendar cal: Calendar) -> Date {
        return cal.date(from: DateComponents(year: cal.component(.year, from: date), month: cal.component(.month, from: date), day: cal.component(.day, from: date)))!
    }

}



extension ThrowBackPhotoAllViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dateAlbum = result[dateOrder[indexPath.section]]!
        let prefixDateAlbum = dateAlbum.prefix(indexPath.row)
        let suffixDateAlbum = dateAlbum.suffix(dateAlbum.count - indexPath.row)
        
        result[dateOrder[indexPath.section]] = suffixDateAlbum.map{$0} + prefixDateAlbum.map{$0}
        
        var s = result[dateOrder[indexPath.section]]!
        for (key, value) in result {
            if key == dateOrder[indexPath.section] {
                continue
            }
            s += value
        }
        
        album.photos = s
        
        performSegue(withIdentifier: "toTBView", sender: album)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTBView" {
            
            let inputVC = segue.destination as! ThrowBackViewController
            
            inputVC.album = sender as? Album
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize = self.view.bounds.width / 3 - 2
        
        return CGSize(width: cellSize, height: cellSize)
        
    }
}
