//
//  AdvicesViewController.swift
//  Mashay
//
//  Created by AliMac on 10/24/17.
//  Copyright © 2017 TurathAlanbiaa. All rights reserved.
//

import UIKit

class AdvicesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource
{

    @IBOutlet weak var advicesTableView: UITableView!
    
    override func viewDidLoad()
    {
        advicesTableView.delegate = self
        advicesTableView.dataSource = self
        
        self.advicesTableView.rowHeight = UITableViewAutomaticDimension
        self.advicesTableView.estimatedRowHeight = 200
        self.advicesTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        super.viewDidLoad()
    }

    @IBAction func dismiss(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.advicesTableView.dequeueReusableCell(withIdentifier: "adviceCell", for: indexPath) as! AdviceTableViewCell
        cell.adviceLabel.text = "كلمة كلمة كلمة كلمة كلمة كلمة كلمة كلمة كلمة كلمة كلمة كلمة"
        return cell
    }


}
