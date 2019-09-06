//
//  DeletePhotosViewController.swift
//  Memoria
//
//  Created by Suzuki Mariko on 26/08/2019.
//  Copyright © 2019 Mariko. All rights reserved.................................................................................................................
//

import UIKit
import Koloda

class DeletePhotosViewController: UIViewController {
    
    @IBOutlet weak var KolodaView: UIView!
    
    let images = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "20",
        "21",
        "22",
        "23",
        "24",
        "25",
        "26",
        "27",
        "28",
        "29",
        "30"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        kolodaView.dataSource = self
//        kolodaView.delegate = self
    }
    
    @IBAction func didClickStay(_ sender: UIButton) {
//        KolodaView.
    }
    @IBAction func didClickDelete(_ sender: UIButton) {
    }
    @IBAction func didClickBack(_ sender: UIButton) {
//        KolodaView.revert
    }
    
}

//extension ViewController: KolodaViewDelegate, KolodaViewDataSource {
//    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
//        //上でUIViewを返しているのに、下ではimageViewでエラーが発生しないのは、UIViewの中にimageViewが存在しているから
//        
//        // 画像を生成
//        let image = UIImage(named: images[index])
//        // ImageViewに生成した画像を設定
//        let imageView = UIImageView(image: image)
//        // ImageViewを返す
//        return imageView
//    }
//    
//    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
//        return images.count
//    }
//    
//    // この記述をすることで、上下左右どこにでもスワイプをすることを可能にすることができる！！！！！！！
//    // 逆にこれがないと不可能。
//    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
//        return [.left, .right, .up, .down]
//    }
//}
