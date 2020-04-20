//
//  ViewController.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/18.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var userTableView: UITableView!
    
    lazy private var viewModel:MainViewModel = {
           return MainViewModel()
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        userTableView = UITableView()
        self.view.addSubview(userTableView)
        
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        userTableView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100).isActive = true
        userTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        userTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        userTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        userTableView.estimatedRowHeight = 80
        userTableView.rowHeight = UITableView.automaticDimension
        userTableView.register(usersTableViewCell.self, forCellReuseIdentifier: "usersTableViewCell")
        userTableView.delegate = self
        userTableView.dataSource = self
        
        getUserList()
 
    }
    
    func getUserList() {
        
        viewModel.getInfoOfUsers(startFromId: 1) { (bool) in
             if bool == true {
                 self.viewModel.isFetching = false
                 DispatchQueue.main.async {
                     self.userTableView.reloadData()
                 }
             } else {
                print("fail to get user list")
            }
         }
    }
    
    
    func toAvatarDetailPage(loginName:String) {
        
        viewModel.getSingleUserWith(loginName: loginName) { (bool) in
            if bool == true {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toAvatarDetail", sender: nil)
                }
            } else {
                
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toAvatarDetail":
            
            let destinationVC = segue.destination as! AvatarDetailViewController
            destinationVC.viewModel = self.viewModel.avatarDetailVM
            
        default:
            break
        }
    }
   
}

extension MainViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let list = viewModel.list {
            return list.count
        } else {
            return 0
        }
 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersTableViewCell") as! usersTableViewCell
        guard let list = viewModel.list else {
            return UITableViewCell()
        }
        
        cell.setData(dataArray: list, indexPath: indexPath)
        
        if list.count - indexPath.row == 3 {
            getUserList()
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let list = viewModel.list {
            let selectAvatarName = list[indexPath.row].login
            self.toAvatarDetailPage(loginName: selectAvatarName)
        }
        
    }
    
}
