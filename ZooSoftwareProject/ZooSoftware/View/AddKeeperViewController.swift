//
//  AddKeeperViewController.swift
//  ZooSoftware
//
//  Created by Hasan Uysal on 20.11.2022.
//

import UIKit

class AddKeeperViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var animalTextField: UITextField!
    @IBOutlet weak var keepingAnimalsLabel: UILabel!
    @IBOutlet weak var addKeeperButton: UIButton!
    
    private var animalPickerView = UIPickerView()
    
    var animals: [Animal] = []
    var zoo: Zoo!
    var chosenAnimals: [Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPickerViewsDelegate()
        setPickerViewsToInputView()
        
        addKeeperButton.isHidden = true
        keepingAnimalsLabel.text = "Seçilen Hayvanlar:"
        
        animals = zoo.animals.filter( { $0.keeper == nil })

    }
    
    private func setPickerViewsToInputView(){
        animalTextField.inputView = animalPickerView
        animalTextField.textAlignment = .left
    }
    
    private func setPickerViewsDelegate(){
        animalPickerView.delegate = self
        animalPickerView.dataSource = self
    }
    
    private func setAnimalsToKeeper(keeper: Keeper){
        zoo.keepers.append(keeper)
    }

    @IBAction func addAnimalButtonPressed(_ sender: Any) {
        if nameTextField.text != "" {
            let chosenAnimalNames = chosenAnimals.map { $0.name }
            let chosenAnimalString = chosenAnimalNames.joined(separator: " ")
            keepingAnimalsLabel.text = "Seçilen Hayvanlar: \(chosenAnimalString)"
            addKeeperButton.isHidden = false
        }else {
            // alert please enter name
        }
    }
    
    @IBAction func addKeeperButtonPressed(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        let keeper = Keeper(name: name)
        keeper.keepingAnimals = chosenAnimals
        setAnimalsToKeeper(keeper: keeper)
        navigationController?.popToRootViewController(animated: true)
    }
}

extension AddKeeperViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        animals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        animals[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        animalTextField.text = animals[row].name
        chosenAnimals.append(animals[row])
        animalTextField.resignFirstResponder()
       
       
       
    }
    
    
}
