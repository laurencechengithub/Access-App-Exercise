//
//  ViewController.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/18.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    lazy private var viewModel:MainViewModel = {
           return MainViewModel()
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
   
}

extension MainViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersTableViewCell") as! usersTableViewCell
        cell.setData(imageURL: <#T##String#>, name: viewModel.list[indexPath.row].login)
        
    }
    
    
    
    
}
