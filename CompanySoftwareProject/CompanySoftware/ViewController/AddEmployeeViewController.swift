//
//  AddEmployeeViewController.swift
//  CompanySoftware
//
//  Created by Hasan Uysal on 16.11.2022.
//

import UIKit

class AddEmployeeViewController: UIViewController {
    
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sirnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var numOfChildsTextField: UITextField!
    @IBOutlet weak var maritalStatusPickerView: UIPickerView!
    @IBOutlet weak var employeeTypePickerView: UIPickerView!
    @IBOutlet weak var pozitionPickerView: UIPickerView!
    @IBOutlet weak var addEmployeeButton: UIButton!
    
    var positionArr = ["Manager", "Developer", "Worker"]
    var maritalStatusArr = ["Evli", "Bekar"]
    var developerLabelArr = ["Intern", "Junior", "Mid", "Senior", "Lead", "Head"]
    
    var homeViewModel = HomeViewModel()
    var softwareDeveloper: SoftwareDeveloper!
    
    var name = ""
    var sirname = ""
    var age = ""
    var numOfChilds = ""
    var maritalStatus = MaritalStatus.notMarried
    var developerLabel = DeveloperLabel.intern
    var position = ""
    
    
    var calculatedSalary = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maritalStatusPickerView.delegate = self
        employeeTypePickerView.delegate = self
        pozitionPickerView.delegate = self
        maritalStatusPickerView.dataSource = self
        employeeTypePickerView.dataSource = self
        pozitionPickerView.dataSource = self
        
        addEmployeeButton.isHidden = true
        
        numOfChildsTextField.text = "0"
        
        salaryLabel.text = String(calculatedSalary)
        
        let closeKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(closeKeyboardGestureRecognizer)
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    func createEmployee(){
        self.name = nameTextField.text ?? ""
        self.sirname = sirnameTextField.text ?? ""
        self.age = ageTextField.text ?? ""
        self.numOfChilds = numOfChildsTextField.text ?? ""
        
        
        self.softwareDeveloper = SoftwareDeveloper(id: UUID(), name: name, age: Int(age) ?? 0, label: developerLabel, maritalStatus: maritalStatus, numOfChilds: Int(numOfChilds) ?? 0)
        
    }
    
    @IBAction func addEmployeeButtonPressed(_ sender: Any) {
        homeViewModel.patika.developers.append(self.softwareDeveloper)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func calculateSalaryButtonPressed(_ sender: Any) {
        
        if self.nameTextField.text != "" {
            if self.ageTextField.text != "" {
                self.createEmployee()
                homeViewModel.patika.calculateSalary(developers: [self.softwareDeveloper])
                salaryLabel.text = String(self.softwareDeveloper.salary ?? 0)
                self.addEmployeeButton.isHidden = false
            }
        }
        
    }
}


extension AddEmployeeViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0{
            return 1
        }
        if pickerView.tag == 1{
            return 1
        }
        if pickerView.tag == 2{
            return 1
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return self.positionArr.count
        }
        if pickerView.tag == 1{
            return self.developerLabelArr.count
        }
        if pickerView.tag == 2{
            return self.maritalStatusArr.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return self.positionArr[row]
        }
        if pickerView.tag == 1{
            return self.developerLabelArr[row]
        }
        if pickerView.tag == 2{
            return self.maritalStatusArr[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            self.position = self.positionArr[row]
        }
        if pickerView.tag == 1{
            if self.developerLabelArr[row] == "intern" {
                self.developerLabel = DeveloperLabel.intern
            }
            if self.developerLabelArr[row] == "Junior" {
                self.developerLabel = DeveloperLabel.jr
            }
            if self.developerLabelArr[row] == "Mid" {
                self.developerLabel = DeveloperLabel.mid
            }
            if self.developerLabelArr[row] == "Senior" {
                self.developerLabel = DeveloperLabel.sr
            }
            if self.developerLabelArr[row] == "Lead" {
                self.developerLabel = DeveloperLabel.lead
            }
            if self.developerLabelArr[row] == "Head" {
                self.developerLabel = DeveloperLabel.head
            }
            
        }
        if pickerView.tag == 2{
            
            if self.maritalStatusArr[row] == "Evli" {
                self.maritalStatus = MaritalStatus.married
            }
            if self.maritalStatusArr[row] == "Bekar" {
                self.maritalStatus = MaritalStatus.notMarried
            }
            
        }
    }
    
}
