//
//  DeletePhotosSelectViewController.swift
//  Memoria
//
//  Created by Suzuki Mariko on 26/08/2019.
//  Copyright © 2019 Mariko. All rights reserved.
//

import UIKit
import Photos

var PhotoAssets = [PHAsset]()

class DeletePhotosSelectViewController: UIViewController {

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


extension DeletePhotosSelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let album = albums[indexPath.row]
        
        cell.textLabel?.text = album.title
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = albums[indexPath.row]
        
        performSegue(withIdentifier: "toDelete", sender: photo)
    }
    // 次の画面に情報を引き継ぐ

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDelete" {
        
        let inputVC = segue.destination as! DeletePhotosViewController
            
            inputVC.album = sender as? Album
        }
    }
    
    
}
