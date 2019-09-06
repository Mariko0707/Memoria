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
    
    var album:Album! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        kolodaView.dataSource = self
//        kolodaView.delegate = self
    }
    
    @IBAction func didClickStay(_ sender: UIButton) {
    }
    @IBAction func didClickDelete(_ sender: UIButton) {
    }
    @IBAction func didClickBack(_ sender: UIButton) {
    }
    
}

extension ViewController: KolodaViewDelegate, KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let photo = UIImage(named: images[index])
        let photoView = UIImageView(image: image)
    }
    
}
