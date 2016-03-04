//
//  Extensions.swift
//  Cashy_Pos
//
//  Created by Martin Wildfeuer on 04.03.16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit
import Photos

extension UIImageView {
    
    func imageFromAssetURL(assetURL: NSURL) {
        let asset = PHAsset.fetchAssetsWithALAssetURLs([assetURL], options: nil)
        let result = asset.objectAtIndex(0) as! PHAsset
        let imageManager = PHImageManager.defaultManager()
        imageManager.requestImageForAsset(result, targetSize: CGSize(width: 200, height: 200), contentMode: PHImageContentMode.AspectFill, options: nil) { (image, dict) -> Void in
            if let image = image {
                self.image = image
            }
        }
    }
}

