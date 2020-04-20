//
//  AvatarDetailViewController.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/20.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import UIKit
import Kingfisher

class AvatarDetailViewController: UIViewController {
    
    weak var viewModel : AvatarDetailViewModel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarNameLabel: UILabel!
    @IBOutlet weak var avatarLoginLable: UILabel!
    @IBOutlet weak var avatarLocation: UILabel!
    @IBOutlet weak var avatarBlogLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
        
    
    func setView () {
        
        if let avatarDetail = viewModel.avatarDetail {
            let imageUrl = URL(string: avatarDetail.avatarURL)
            avatarImageView.kf.setImage(with: imageUrl)
            
            self.avatarNameLabel.text = avatarDetail.name
            self.avatarLoginLable.text = avatarDetail.login
            self.avatarBlogLabel.text = avatarDetail.blog
        }
    }
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true) {
            
        }
        
    }

}
