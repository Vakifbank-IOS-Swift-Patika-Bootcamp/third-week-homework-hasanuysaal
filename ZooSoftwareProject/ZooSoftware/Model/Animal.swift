//
//  Animal.swift
//  ZooSoftware
//
//  Created by Hasan Uysal on 19.11.2022.
//

import Foundation

enum keepingDifficuality: Double, CaseIterable {
    case easy = 0.1, normal = 0.5 , hard = 1.0
    
    var title: String{
        switch self{
        case .easy: return "Easy"
        case .normal: return "Normal"
        case .hard: return "Hard"
        }
    }
}

enum Breed: String, CaseIterable {
    case cat = "Kedi"
    case dog = "Köpek"
    case cow = "İnek"
    case camel = "Deve"
}

protocol Animal {
    
    var name: String {get set}
    var breed: Breed? {get set}
    var waterConsumption: Double {get set}
    var drinkedWater: Bool {get set}
    var keepingDifficuality: keepingDifficuality {get set}
    var keeper: Keeper? {get set}
    var zoo: Zoo {get set}
    func sound()
    mutating func drinkWater()
    
}


class Cat: Animal {
    
    var name: String
    var breed: Breed?
    var waterConsumption: Double
    var drinkedWater = false
    var keepingDifficuality: keepingDifficuality
    var keeper: Keeper?
    var zoo: Zoo
    
    init(name: String, breed: Breed? = nil, waterConsumption: Double, keepingDifficuality: keepingDifficuality, zoo: Zoo){
        self.name = name
        self.waterConsumption = waterConsumption
        self.keepingDifficuality = keepingDifficuality
        self.breed = breed
        self.zoo = zoo
    }
    
    func sound() {
        if let breed = self.breed {
            if breed == .cat {
                print("Meoowww")
            }
        } else {
            print("Miyav")
        }
        
    }
    
    func drinkWater() {
        if !self.drinkedWater {
            self.drinkedWater = self.zoo.decraiseWaterCapacity(with: self.waterConsumption)
        }
    }
}

class Dog: Animal {
    
    var name: String
    var breed: Breed?
    var waterConsumption: Double
    var drinkedWater = false
    var keepingDifficuality: keepingDifficuality
    var keeper: Keeper?
    var zoo: Zoo
    
    init(name: String, breed: Breed? = nil, waterConsumption: Double, keepingDifficuality: keepingDifficuality, zoo: Zoo){
        self.name = name
        self.waterConsumption = waterConsumption
        self.keepingDifficuality = keepingDifficuality
        self.zoo = zoo
    }
    
    func sound() {
        print("Havv")
    }
    
    func drinkWater() {
        if !self.drinkedWater {
            self.drinkedWater = self.zoo.decraiseWaterCapacity(with: self.waterConsumption)
        }
    }
}

class Cow: Animal {
    
    var name: String
    var breed: Breed?
    var waterConsumption: Double
    var drinkedWater = false
    var keepingDifficuality: keepingDifficuality
    var keeper: Keeper?
    var zoo: Zoo
    
    init(name: String, breed: Breed? = nil, waterConsumption: Double, keepingDifficuality: keepingDifficuality, zoo: Zoo){
        self.name = name
        self.waterConsumption = waterConsumption
        self.keepingDifficuality = keepingDifficuality
        self.zoo = zoo
    }
    
    func sound() {
        print("Mööö")
    }
    
    
    func drinkWater() {
        if !self.drinkedWater {
            self.drinkedWater = self.zoo.decraiseWaterCapacity(with: self.waterConsumption)
        }
    }
}

class Camel: Animal {
    
    var name: String
    var breed: Breed?
    var waterConsumption: Double
    var drinkedWater = false
    var keepingDifficuality: keepingDifficuality
    var keeper: Keeper?
    var zoo: Zoo
    
    init(name: String, breed: Breed? = nil, waterConsumption: Double, keepingDifficuality: keepingDifficuality, zoo: Zoo){
        self.name = name
        self.waterConsumption = waterConsumption
        self.keepingDifficuality = keepingDifficuality
        self.zoo = zoo
    }
    
    func sound() {
        print("Camel's sound...")
    }
    
    func drinkWater() {
        if !self.drinkedWater {
            self.drinkedWater = self.zoo.decraiseWaterCapacity(with: self.waterConsumption)
        } else {
            print("\(self.name) has already drunk water")
        }
    }
}
