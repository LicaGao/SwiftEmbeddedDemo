//
//  ImgCollectionViewCell.swift
//  SwiftEmbeddedDemo
//
//  Created by 高鑫 on 2017/11/15.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ImgCollectionViewCell: UICollectionViewCell {
    var img = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        img.frame = CGRect(x: 15, y: 15, width: 120, height: 120)
        img.center.y = self.center.y
        self.addSubview(img)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
