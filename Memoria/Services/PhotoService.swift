//
//  PhotoService.swift
//  Memoria
//
//  Created by yonekan on 2019/09/04.
//  Copyright © 2019 Mariko. All rights reserved.
//

import Photos

class PhotoService {
    
    // iPhone内にある全アルバムを取得します
    func getAllAlbum() -> [Album] {
        
        var albums:[Album] = []
        
        let assets: PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)
        
        assets.enumerateObjects { (asset, index, stop) in
            
            let album = Album(localIdentifier: asset.localIdentifier, title: asset.localizedTitle!)
            
            albums.append(album)
        }
        
        return albums
    }
    
}
