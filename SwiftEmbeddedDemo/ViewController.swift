//
//  ViewController.swift
//  SwiftEmbeddedDemo
//
//  Created by 高鑫 on 2017/11/15.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

let w = UIScreen.main.bounds.width
let h = UIScreen.main.bounds.height

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(ImgTableViewCell.self, forCellReuseIdentifier: "imgCell")
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: "lbCell")
        let embeddedNib = UINib(nibName: "EmbeddedTableViewCell", bundle: nil)
        tableView.register(embeddedNib, forCellReuseIdentifier: "embCell")
        
        let notificationName = Notification.Name(rawValue: "update")
        NotificationCenter.default.addObserver(self, selector: #selector(updateImg(notification:)), name: notificationName, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func updateImg(notification: NotificationCenter) {
        let index = IndexPath.init(row: 0, section: 0)
        tableView.reloadRows(at: [index], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return w
        } else if indexPath.row == 1 {
            return 150
        } else {
            return 40
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let imgCell = tableView.dequeueReusableCell(withIdentifier: "imgCell", for: indexPath) as! ImgTableViewCell
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            imgCell.imgView.image = UIImage(named: appDelegate.imgNm)
            imgCell.selectionStyle = .none
            return imgCell
        } else if indexPath.row == 1 {
            let embCell = tableView.dequeueReusableCell(withIdentifier: "embCell", for: indexPath) as! EmbeddedTableViewCell
            embCell.selectionStyle = .none
            return embCell
        } else {
            let lbCell = tableView.dequeueReusableCell(withIdentifier: "lbCell", for: indexPath) as! LabelTableViewCell
            var nums : [String] = []
            for i in 1...10 {
                nums.append("\(i)")
            }
            lbCell.textLb.text = nums[indexPath.row - 2]
            lbCell.selectionStyle = .none
            return lbCell
        }
    }

}

class ImgTableViewCell: UITableViewCell {
    var imgView = UIImageView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "imgCell")
        imgView.frame = CGRect(x: 0, y: 0, width: w, height: w)
        self.addSubview(imgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LabelTableViewCell: UITableViewCell {
    var textLb = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "lbCell")
        textLb.frame = self.frame
        textLb.center.x = w / 2
        textLb.textAlignment = .center
        self.addSubview(textLb)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
