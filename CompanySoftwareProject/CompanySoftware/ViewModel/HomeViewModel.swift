//
//  HomeViewModel.swift
//  CompanySoftware
//
//  Created by Hasan Uysal on 16.11.2022.
//

import Foundation

class HomeViewModel {
    
    var patika = SoftwareCompany(name: "Patika.dev",email: "info@patika.dev", developers: [], budget: 500000, foundationYear: 2018)
    
    var softwareDevelopers = [SoftwareDeveloper]()
    
    var sd1 = SoftwareDeveloper(id: UUID(), name: "Hasan", age: 25, label: .jr, maritalStatus: .notMarried, numOfChilds: 0)
    var sd2 = SoftwareDeveloper(id: UUID(), name: "Ali", age: 27, label: .mid, maritalStatus: .married, numOfChilds: 1)
    var sd3 = SoftwareDeveloper(id: UUID(), name: "Ahmet", age: 33, label: .sr, maritalStatus: .married, numOfChilds: 2)
    var sd4 = SoftwareDeveloper(id: UUID(), name: "Mehmet", age: 40, label: .lead, maritalStatus: .notMarried, numOfChilds: 0)
    var sd5 = SoftwareDeveloper(id: UUID(), name: "Serkan", age: 45, label: .head, maritalStatus: .married, numOfChilds: 3)
    var sd6 = SoftwareDeveloper(id: UUID(), name: "Ayşe", age: 30, label: .mid, maritalStatus: .notMarried, numOfChilds: 0)
    var sd7 = SoftwareDeveloper(id: UUID(), name: "Fatma", age: 20, label: .intern, maritalStatus: .notMarried, numOfChilds: 0)
    
    
    init(){
        self.softwareDevelopers = [self.sd1, self.sd2, self.sd3, self.sd4, self.sd5, self.sd6, self.sd7]
        self.patika.developers = softwareDevelopers
        patika.calculateSalary(developers: self.softwareDevelopers)
        
    }
    
    
    
}
