//
//  EmployeeListViewController.swift
//  CompanySoftware
//
//  Created by Hasan Uysal on 16.11.2022.
//

import UIKit

class EmployeeListViewController: UIViewController{
    
    @IBOutlet weak var employeeListTableView: UITableView!
    
    var homeViewModel: HomeViewModel!
    var softwareDevelopers: [SoftwareDeveloper] = []
    var itemsToShow: [SoftwareDeveloper] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeListTableView.delegate = self
        employeeListTableView.dataSource = self
        
        softwareDevelopers = homeViewModel.patika.developers
        
        itemsToShow = softwareDevelopers
        
        employeeListTableView.register(UINib(nibName: "EmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Enter employee name"
        navigationItem.searchController = search
        
        navigationItem.title = "Aramak için aşağı kaydır"
        
    }
    
}

extension EmployeeListViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        self.itemsToShow = self.softwareDevelopers.filter( { $0.name == text })
        if text == "" {
            self.itemsToShow = self.softwareDevelopers
        }
        self.employeeListTableView.reloadData()
    }
    
}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! EmployeeListTableViewCell
        cell.nameLabel.text = self.itemsToShow[indexPath.row].name
        cell.salaryLabel.text = String(self.itemsToShow[indexPath.row].salary ?? 0.0)
        return cell
    }
    
}
