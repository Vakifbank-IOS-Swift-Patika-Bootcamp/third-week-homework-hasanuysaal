//
//  Employee.swift
//  CompanySoftware
//
//  Created by Hasan Uysal on 16.11.2022.
//

import Foundation

enum MaritalStatus {
    case married, notMarried
}

enum DeveloperLabel: Int {
    case intern = 1, jr, mid, sr, lead, head
}

protocol Employee {
    
    var name: String {get set}
    var age: Int {get set}
    var maritalStatus: MaritalStatus? {get set}
    var numOfChilds: Int? {get set}
    
}

class SoftwareDeveloper: Employee {
    
    var id: UUID
    var name: String
    var age: Int
    var label: DeveloperLabel
    var maritalStatus: MaritalStatus?
    var numOfChilds: Int?
    var salary: Double?
    var isSalaryPaid = false
    
    init(id: UUID, name: String, age: Int, label: DeveloperLabel, maritalStatus: MaritalStatus? = .notMarried, numOfChilds: Int? = 0){
        self.id = id
        self.name = name
        self.age = age
        self.label = label
        self.maritalStatus = maritalStatus
        self.numOfChilds = numOfChilds
    }
    
}
