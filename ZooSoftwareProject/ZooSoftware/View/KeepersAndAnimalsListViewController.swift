//
//  KeepersAndAnimalsListViewController.swift
//  ZooSoftware
//
//  Created by Hasan Uysal on 20.11.2022.
//

import UIKit

class KeepersAndAnimalsListViewController: UIViewController {

    @IBOutlet private weak var keepersAndAnimalsCollectionView: UICollectionView!
    
    var keepers: [Keeper] = []
    var animals: [Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionViewCell()

        keepersAndAnimalsCollectionView.dataSource = self
        
    }
    
    private func registerCollectionViewCell(){
        keepersAndAnimalsCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    


}

extension KeepersAndAnimalsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        keepers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = keepersAndAnimalsCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.keeper = keepers[indexPath.row]
        cell.animal = animals[indexPath.row].name
        return cell
    }
    
    
}
