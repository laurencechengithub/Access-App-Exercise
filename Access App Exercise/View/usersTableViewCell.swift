//
//  usersTableViewCell.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/19.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import UIKit
import Kingfisher

class usersTableViewCell: UITableViewCell {

    var avatarPicImageView: UIImageView!
    var avatarNameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setView() {
        
        self.avatarPicImageView = UIImageView()
        self.avatarNameLabel = UILabel()
        self.contentView.addSubview(avatarPicImageView)
        self.contentView.addSubview(avatarNameLabel)
        
        avatarPicImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarPicImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        avatarPicImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 10).isActive = true
        avatarPicImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        avatarPicImageView.widthAnchor.constraint(equalToConstant:60).isActive = true
        avatarPicImageView.layer.cornerRadius = 30
        
        avatarNameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarNameLabel.leadingAnchor.constraint(equalTo: self.avatarPicImageView.trailingAnchor, constant: 10).isActive = true
        avatarNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant:10).isActive = true
        avatarNameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        avatarNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        avatarNameLabel.textColor = UIColor.darkGray
        avatarNameLabel.textAlignment = .left
        avatarNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
              
        
    }
    
    func setData(dataArray:[GetAllUserData],indexPath:IndexPath) {
        
        let imageUrl = URL(string: dataArray[indexPath.row].avatarURL)
        avatarPicImageView.kf.setImage(with: imageUrl)
        self.avatarNameLabel.text = dataArray[indexPath.row].login
        
    }
    
}
