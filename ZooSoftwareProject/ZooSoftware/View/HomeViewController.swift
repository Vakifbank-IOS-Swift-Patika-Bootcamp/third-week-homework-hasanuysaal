//
//  ViewController.swift
//  ZooSoftware
//
//  Created by Hasan Uysal on 15.11.2022.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var keeperCountLabel: UILabel!
    @IBOutlet weak var animalCountLabel: UILabel!
    @IBOutlet weak var waterCapacityLabel: UILabel!
    @IBOutlet private weak var budgetLabel: UILabel!
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var waterCapacityTextField: UITextField!
    
    private var zoo: Zoo!
    private var cat1: Cat!
    private var cat2: Cat!
    private var cat3: Cat!
    private var dog1: Dog!
    private var cow1: Cow!
    private var keeper1: Keeper!
    private var keeper2: Keeper!
    private var animals: [Animal]!
    private var keepers: [Keeper]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeZoo()
        initializeKeeper()
        initializeAnimal()
        setAnimalsToKeeper()
        
        navigationItem.title = zoo.name
        
        
        waterCapacityLabel.text = String(zoo.dailyWaterCapacity)
        budgetLabel.text = String(zoo.budget)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        keeperCountLabel.text = String(zoo.keepers.count)
        animalCountLabel.text = String(zoo.animals.count)
    }
    
    private func initializeZoo(){
        zoo = Zoo(name: "Hayvanat Bahçesi", dailyWaterCapacity: 1200, budget: 100000)
    }
    
    private func initializeKeeper(){

        let keeper1 = Keeper(name: "Hasan")
        let keeper2 = Keeper(name: "Ali")
        keepers = [keeper1, keeper2]
       
        // Hayvanat bahçesinin bakıcılar ve hayvanlar propertyleri setlendi.
        zoo.keepers = keepers
        
    }
    
    private func initializeAnimal(){
        
        cat1 = Cat(name: "Zeytin", breed: .cat, waterConsumption: 60,keepingDifficuality: .easy, zoo: zoo)
        cat2 = Cat(name: "Garfield", waterConsumption: 50,keepingDifficuality: .easy, zoo: zoo)
        cat3 = Cat(name: "Şerafettin", waterConsumption: 70,keepingDifficuality: .easy, zoo: zoo)
        dog1 = Dog(name: "Paşa", waterConsumption: 70, keepingDifficuality: .easy, zoo: zoo)
        cow1 = Cow(name: "Sarıkız", waterConsumption: 150,keepingDifficuality: .normal, zoo: zoo)
        let cow2 = Cow(name: "Benekli", waterConsumption: 150,keepingDifficuality: .normal, zoo: zoo)
        let camel1 = Camel(name: "Deve", waterConsumption: 1000,keepingDifficuality: .hard, zoo: zoo)
        animals = [cat1, cat2, cat3, dog1, cow1, cow2, camel1] as [Animal]
        zoo.animals = animals

    }
    
    private func setAnimalsToKeeper(){
        zoo.setKeepingAnimals(animals: [cat1, dog1], keeper: self.zoo.keepers[0])
        zoo.setKeepingAnimals(animals: [cat2, cat3], keeper: self.zoo.keepers[1])
    }

    @IBAction func paySalaryButtonPressed(_ sender: Any) {
        zoo.paySalary(keepers: self.keepers)
        budgetLabel.text = String(zoo.budget)
    }
    
    @IBAction func showKeepersButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toKeepersAndAnimalsListVC", sender: nil)
    }
    
    @IBAction func addKeeperButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toAddKeeperVC", sender: nil)
    }
    
    @IBAction func addAnimalButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toAddAnimalVC", sender: nil)
    }
    
    
    @IBAction func showAnimalsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toKeepersAndAnimalsListVC", sender: nil)
    }
    
    @IBAction func waterCapacityIncreaseButtonPressed(_ sender: Any) {
        guard let value = Double(waterCapacityTextField.text ?? "0.0")  else {
            return
        }
        
        zoo.dailyWaterCapacity = zoo.dailyWaterCapacity + value
        waterCapacityTextField.text = ""
        waterCapacityLabel.text = String(zoo.dailyWaterCapacity)
    }
    
    @IBAction func waterCapacityDecreaseButtonPressed(_ sender: Any) {
        guard let value = Double(waterCapacityTextField.text ?? "0.0")  else {
            return
        }
        
        zoo.dailyWaterCapacity = zoo.dailyWaterCapacity - value
        waterCapacityTextField.text = ""
        waterCapacityLabel.text = String(zoo.dailyWaterCapacity)
    }
    
    @IBAction func budgetIncreaseButtonPressed(_ sender: Any) {
        guard let value = Double(budgetTextField.text ?? "0.0")  else {
            return
        }
        
        zoo.budget = zoo.budget + value
        budgetTextField.text = ""
        budgetLabel.text = String(zoo.budget)
    }
    
    @IBAction func budgetDecreaseButtonPressed(_ sender: Any) {
        guard let value = Double(budgetTextField.text ?? "0.0")  else {
            return
        }
        
        zoo.budget = zoo.budget - value
        budgetTextField.text = ""
        budgetLabel.text = String(zoo.budget)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddAnimalVC" {
            let destinationVC = segue.destination as! AddAnimalViewController
            destinationVC.zoo = self.zoo
        }
        if segue.identifier == "toAddKeeperVC" {
            let destinationVC = segue.destination as! AddKeeperViewController
            destinationVC.zoo = self.zoo
        }
        if segue.identifier == "toKeepersAndAnimalsListVC" {
            let destinationVC = segue.destination as! KeepersAndAnimalsListViewController
            destinationVC.keepers = self.zoo.keepers
            destinationVC.animals = self.zoo.animals
        }
        
    }
}

