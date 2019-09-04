//
//  ThrowBackSelectViewController.swift
//  Memoria
//
//  Created by Suzuki Mariko on 26/08/2019.
//  Copyright © 2019 Mariko. All rights reserved.
//

import UIKit
import RealmSwift
import Photos

var photoAssets = [PHAsset]()


class ThrowBackSelectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var albums:[PhotoAlbum] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
