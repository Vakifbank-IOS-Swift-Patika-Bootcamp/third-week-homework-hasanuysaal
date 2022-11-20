//
//  Company.swift
//  CompanySoftware
//
//  Created by Hasan Uysal on 16.11.2022.
//

import Foundation

protocol Company {
    
    var name: String {get set}
    var email: String {get set}
    var developers: [SoftwareDeveloper] {get set}
    var budget: Double {get set}
    var foundationYear: Int {get set}
    
    func addIncome(income: Double)
    func addExpense(expense: Double)
    
}

class SoftwareCompany: Company {
    
    var name: String
    var email: String
    var developers: [SoftwareDeveloper]
    var budget: Double
    var foundationYear: Int
    
    init(name: String, email: String, developers: [SoftwareDeveloper], budget: Double, foundationYear: Int){
        self.name = name
        self.email = email
        self.developers = developers
        self.budget = budget
        self.foundationYear = foundationYear
    }
    
    func addIncome(income: Double)  {
        self.budget = self.budget + income
        
    }
    
    func addExpense(expense: Double) {
        self.budget = self.budget - expense
        
    }
    
    
    func paySalary(developers: [SoftwareDeveloper], completion: (MaritalStatus, SoftwareDeveloper) -> Void ){
        
        for developer in developers {
            
            if !developer.isSalaryPaid {
                if let salary = developer.salary {
                    
                    self.budget = self.budget - salary
                    developer.isSalaryPaid = true
                    if let maritalStatus = developer.maritalStatus {
                        completion(maritalStatus, developer)
                    }
                    
                }
                
            } else {
                continue
            }
        }
    }
    
    
    func calculateCoefficient(developer: SoftwareDeveloper) -> Double {
        let coefficient = Double(developer.age * developer.label.rawValue) / 100
        return coefficient
    }
    
    func additionalSalary(developer: SoftwareDeveloper, salary: Double) -> Double{
        var newSalary = salary
        if let numOfChilds = developer.numOfChilds  {
            newSalary = salary + Double(numOfChilds * 200)
        }
        return newSalary
        
    }
    
    func calculateSalary(developers: [SoftwareDeveloper]) {
        
        for developer in developers {
            var salary = 0.0
            
            switch developer.label {
            case .intern:
                salary = 5000
                salary = salary + salary * calculateCoefficient(developer: developer)
                salary = additionalSalary(developer: developer, salary: salary)
                developer.salary = salary
            case .jr:
                salary = 6000
                salary = salary + salary * calculateCoefficient(developer: developer)
                salary = additionalSalary(developer: developer, salary: salary)
                developer.salary = salary
            case .mid:
                salary = 7000
                salary = salary + salary * calculateCoefficient(developer: developer)
                salary = additionalSalary(developer: developer, salary: salary)
                developer.salary = salary
            case .sr:
                salary = 8000
                salary = salary + salary * calculateCoefficient(developer: developer)
                salary = additionalSalary(developer: developer, salary: salary)
                developer.salary = salary
            case .lead:
                salary = 9000
                salary = salary + salary * calculateCoefficient(developer: developer)
                salary = additionalSalary(developer: developer, salary: salary)
                developer.salary = salary
            case .head:
                salary = 10000
                salary = salary + salary * calculateCoefficient(developer: developer)
                salary = additionalSalary(developer: developer, salary: salary)
                developer.salary = salary
            }
        }
       
    }
    
}


