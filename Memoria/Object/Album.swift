//
//  Album.swift
//  Memoria
//
//  Created by yonekan on 2019/09/04.
//  Copyright © 2019 Mariko. All rights reserved.
//

import Photos

struct Album {
    
    let localIdentifier: String
    
    let title: String
 
    // アルバム内の写真
    let photos: [PHAsset]
}
