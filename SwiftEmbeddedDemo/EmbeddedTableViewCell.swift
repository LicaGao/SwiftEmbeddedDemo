//
//  EmbeddedTableViewCell.swift
//  SwiftEmbeddedDemo
//
//  Created by 高鑫 on 2017/11/15.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class EmbeddedTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let nms = ["1","2","3","4","5"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImgCollectionViewCell.self, forCellWithReuseIdentifier: "imgItem")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.imgNm = nms[indexPath.row]
        let notificationName = Notification.Name(rawValue: "update")
        NotificationCenter.default.post(name: notificationName, object: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgItem", for: indexPath) as! ImgCollectionViewCell
        cell.img.image = UIImage(named: nms[indexPath.item])
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.backgroundColor = UIColor.groupTableViewBackground
        return cell
    }
}
