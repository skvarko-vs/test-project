//
//  NewWorkerViewController.swift
//  TestProject
//
//  Created by Viktoriia Skvarko on 08.04.2021.
//

import UIKit

class NewWorkerViewController: UITableViewController {
    
    @IBOutlet weak var companyName: UILabel!
    
    var companyNameText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if companyNameText == nil {
            companyName.text = "Компания"
        } else {
            companyName.text = companyNameText
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
}
