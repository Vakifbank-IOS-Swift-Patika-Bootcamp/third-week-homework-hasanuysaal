//
//  ViewController.swift
//  CompanySoftware
//
//  Created by Hasan Uysal on 15.11.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var employeeIconLabel: UILabel!
    @IBOutlet weak var foundationYearLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var employeeCountLabel: UILabel!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var expenseTextField: UITextField!
    
    var homeViewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Çalışan Ekle", style: .done, target: self, action: #selector(toAddEmployeeView))
        
        companyNameLabel.text = homeViewModel.patika.name
        employeeCountLabel.text = String(homeViewModel.softwareDevelopers.count)
        foundationYearLabel.text = String(homeViewModel.patika.foundationYear)
        emailLabel.text = homeViewModel.patika.email
        
        budgetLabel.text = String(homeViewModel.patika.budget)
        
        let closeKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(closeKeyboardGestureRecognizer)
        
        employeeIconLabel.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(employeeIconLabelTapped))
        employeeIconLabel.addGestureRecognizer(tapGR)
        
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.employeeCountLabel.text = String(homeViewModel.patika.developers.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddEmployeeViewController" {
            let destinationVC = segue.destination as! AddEmployeeViewController
            destinationVC.homeViewModel = self.homeViewModel
            
            
        }
        
        if segue.identifier == "toEmployeeListVC" {
            let destinationVC = segue.destination as! EmployeeListViewController
            destinationVC.homeViewModel = self.homeViewModel
        }
    }
    
    @objc func toAddEmployeeView(){
        performSegue(withIdentifier: "toAddEmployeeViewController", sender: nil)
    }
    
    @objc func employeeIconLabelTapped(){
        performSegue(withIdentifier: "toEmployeeListVC", sender: nil)
        
    }
    
    @IBAction func addIncomeButtonPressed(_ sender: Any) {
        guard let income = Int(incomeTextField.text!) else {
            return
        }
        self.homeViewModel.patika.budget = self.homeViewModel.patika.budget + Double(income)
        budgetLabel.text = String(self.homeViewModel.patika.budget)
        incomeTextField.text = ""
        
    }
    
    @IBAction func addExpenseButtonPressed(_ sender: Any) {
        guard let expense = Int(expenseTextField.text!) else {
            return
        }
        if (self.homeViewModel.patika.budget - Double(expense)) < 0 {
            return
        }
        self.homeViewModel.patika.budget = self.homeViewModel.patika.budget - Double(expense)
        budgetLabel.text = String(self.homeViewModel.patika.budget)
        expenseTextField.text = ""
    }
    
    @IBAction func paySalaryButtonPressed(_ sender: Any) {
        self.homeViewModel.patika.paySalary(developers: self.homeViewModel.patika.developers) { maritalStatus, developer in
            if developer.maritalStatus == .married {
                developer.salary = developer.salary! + 500.0
                
            }
        }
        self.budgetLabel.text = String(self.homeViewModel.patika.budget)
    }
    
}

