//
//  Zoo.swift
//  ZooSoftware
//
//  Created by Hasan Uysal on 19.11.2022.
//

import Foundation

class Zoo {
    
    var name: String
    var dailyWaterCapacity: Double
    var budget: Double
    var animals: [Animal] = []
    var keepers: [Keeper] = []
    
    init(name: String, dailyWaterCapacity: Double, budget: Double){
        self.name = name
        self.dailyWaterCapacity = dailyWaterCapacity
        self.budget = budget
    }
    
    
    
    
    func setKeepingAnimals(animals: [Animal], keeper: Keeper ){
        for animal in animals {
            var theAnimal = animal
            keeper.keepingAnimals.append(animal)
            theAnimal.keeper = keeper
        }
        
    }
    
    func addIncome(income: Double){
        self.budget = self.budget + income
    }
    
    func addExpense(expense: Double){
        self.budget = self.budget - expense
    }
    
    func incraiseWaterCapacity(with amount: Double){
        self.dailyWaterCapacity = self.dailyWaterCapacity + amount
    }
    
    func decraiseWaterCapacity(with amount: Double) -> Bool {
        
        if (self.dailyWaterCapacity - amount) < 0 {
            print("There is no water to use")
            return false
        } else {
            self.dailyWaterCapacity = self.dailyWaterCapacity - amount
            return true
        }
    }
    
    func paySalary(keepers: [Keeper]){
        for keeper in keepers {
            self.budget = self.budget - keeper.salary
        }
        
    }
    
    func drinkAllAnimals() {
        for animal in self.animals {
            var anml = animal
            anml.drinkWater()
        }
    }
    
}
