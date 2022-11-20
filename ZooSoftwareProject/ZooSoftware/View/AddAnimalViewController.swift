//
//  AddAnimalViewController.swift
//  ZooSoftware
//
//  Created by Hasan Uysal on 19.11.2022.
//

import UIKit

class AddAnimalViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var waterConsumptionTextField: UITextField!
    @IBOutlet weak var keepingDifficualityTextField: UITextField!
    @IBOutlet weak var keeperTextField: UITextField!
    
    private var difficualityPickerView = UIPickerView()
    private var keeperPickerView = UIPickerView()
    private var breedPickerView = UIPickerView()
    private var difficualities: [String] = []
    private var keepers: [Keeper] = []
    private var breeds: [String] = []
    
    private var chosenKeeper: [Keeper] = []
    private var chosenBreed: [Breed] = []
    private var chosenDifficuality: [keepingDifficuality] = []
    
    var zoo: Zoo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getEnumCasesToPicker()
        keepers = zoo.keepers

        setPickerViewsDelegate()
        setPickerViewsTag()
        setPickerViewsToInputView()

    }
    
    private func setPickerViewsToInputView(){
        keepingDifficualityTextField.inputView = difficualityPickerView
        keepingDifficualityTextField.textAlignment = .left
        
        keeperTextField.inputView = keeperPickerView
        keeperTextField.textAlignment = .left
        
        breedTextField.inputView = breedPickerView
        breedTextField.textAlignment = .left

    }
    
    private func setPickerViewsTag(){
        difficualityPickerView.tag = 1
        keeperPickerView.tag = 2
        breedPickerView.tag = 3
    }
    
    private func setPickerViewsDelegate(){
        difficualityPickerView.delegate = self
        difficualityPickerView.dataSource = self
        
        keeperPickerView.delegate = self
        keeperPickerView.dataSource = self
        
        breedPickerView.delegate = self
        breedPickerView.dataSource = self
        
        
    }
    
    private func getEnumCasesToPicker(){
        difficualities = keepingDifficuality.allCases.map { $0.title }
        breeds = Breed.allCases.map { $0.rawValue }
    }
    
    private func createAnimal() -> Bool{
        if nameTextField.text != "" {
            if breedTextField.text != "" {
                if waterConsumptionTextField.text != "" {
                    if Double(waterConsumptionTextField.text!) != nil {
                        if keepingDifficualityTextField.text != "" {
                            if keeperTextField.text != "" {
                                let animal = Cat(name: nameTextField.text!, breed: chosenBreed.first, waterConsumption: Double(waterConsumptionTextField.text!)!, keepingDifficuality: chosenDifficuality.first!, zoo: zoo)
                                animal.keeper = chosenKeeper.first
                                zoo.animals.append(animal)
                                print(zoo.animals)
                                return true
                            }
                            
                        }
                    }
                }
            }
        }
        return false
    }
    
    @IBAction func addAnimalButtonPressed(_ sender: Any) {
        if createAnimal() {
            navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
}

extension AddAnimalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return difficualities.count
        }
        if pickerView.tag == 2{
            return keepers.count
        }
        if pickerView.tag == 3{
            return breeds.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return difficualities[row]
        }
        if pickerView.tag == 2{
            return keepers[row].name
        }
        if pickerView.tag == 3{
            return breeds[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            keepingDifficualityTextField.text = difficualities[row]
            chosenDifficuality = keepingDifficuality.allCases.filter( { $0.title == difficualities[row] })
            keepingDifficualityTextField.resignFirstResponder()
            
        }
        if pickerView.tag == 2{
            keeperTextField.text = keepers[row].name
            chosenKeeper = zoo.keepers.filter( { $0.name == keepers[row].name })
            keeperTextField.resignFirstResponder()
        }
        if pickerView.tag == 3{
            breedTextField.text = breeds[row]
            chosenBreed = Breed.allCases.filter( { $0.rawValue == breeds[row] })
            breedTextField.resignFirstResponder()
        }
       
    }
    
    
}
