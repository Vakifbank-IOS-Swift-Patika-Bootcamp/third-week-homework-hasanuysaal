//
//  Keeper.swift
//  ZooSoftware
//
//  Created by Hasan Uysal on 19.11.2022.
//

import Foundation

class Keeper {
    
    let id = UUID()
    var name: String
    var keepingAnimals : [Animal] = []
    
    init(name: String) {
        self.name = name
    }
    
    // Bakıcının 5250 ₺ maaşına bonus olarak baktığı hayvanların her biri için +500 ₺ eklenir.
    // Sonrasında hesaplanan maaş, baktığı hayvanların zorluk katsayılarının toplamı ile çarpılarak tekrar maaşa eklenir.
    // Güncel maaş hesaplanır.
    
    var salary: Double {
        
        var newSalary = 5250.0
        
        newSalary = newSalary + Double(keepingAnimals.count * 500)
        
        let keepingAnimalsDifficulities = (keepingAnimals.map({ $0.keepingDifficuality.rawValue }))
        
        var cofficient = 0.0
        
        for difficulity in keepingAnimalsDifficulities {
            cofficient = cofficient + difficulity
        }
        
        newSalary = newSalary + (newSalary * cofficient)
        
        return newSalary
    }
    
}
