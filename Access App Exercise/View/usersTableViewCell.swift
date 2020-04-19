//
//  usersTableViewCell.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/19.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import UIKit

class usersTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarPicImageView: UIImageView!
    @IBOutlet weak var avatarNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setData(imageURL:String,name:String) {
        
        self.avatarNameLabel.text = name
        
        
    }
    
}
