//
//  DeletePhotosViewController.swift
//  Memoria
//
//  Created by Suzuki Mariko on 26/08/2019.
//  Copyright © 2019 Mariko. All rights reserved.................................................................................................................
//

import UIKit
import RealmSwift
import Koloda

class DeletePhotosViewController: UIViewController {
    
    @IBOutlet weak var KokodaView: UIView!
    
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
        "10"
    ]
    
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

