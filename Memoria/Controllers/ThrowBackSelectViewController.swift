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
    var albums:[Album] = []
    
    let photoService = PhotoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        albums = photoService.getAllAlbum()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension ThrowBackSelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let album = albums[indexPath.row]
        
        cell.textLabel?.text = album.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        
        performSegue(withIdentifier: "toNext", sender: album)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! ThrowBackViewController
        nextVC.album = (sender as! Album)
        
    }
}
