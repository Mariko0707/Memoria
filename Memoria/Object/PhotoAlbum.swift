//
//  Album.swift
//  Memoria
//
//  Created by Suzuki Mariko on 28/08/2019.
//  Copyright © 2019 Mariko. All rights reserved.
//

import RealmSwift


class PhotoAlbum: Object {
    
    // ID (連番)
    @objc dynamic var id: Int = 0

    @objc dynamic var localIdentifier = ""
    
    @objc dynamic var image: UIImage? = nil
    
    @objc dynamic private var imageData: NSData? = nil
}


