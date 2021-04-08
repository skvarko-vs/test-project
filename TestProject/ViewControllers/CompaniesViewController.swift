//
//  CompaniesViewController.swift
//  TestProject
//
//  Created by Viktoriia Skvarko on 08.04.2021.
//

import UIKit

class CompaniesViewController: UITableViewController {
    
    @IBOutlet var companyTable: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ChooseCompanySegue" else { return }
        
        if let cell = sender as? UITableViewCell,
           let indexPath = companyTable.indexPath(for: cell),
           let vc = segue.destination as? NewWorkerViewController {
            vc.companyNameText = CompaniesList().companies[indexPath.row]
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let counts = CompaniesList().companies.count
        return counts
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Company Cell", for: indexPath)
        cell.textLabel?.text = CompaniesList().companies[indexPath.row]
        return cell
    }
    
}
