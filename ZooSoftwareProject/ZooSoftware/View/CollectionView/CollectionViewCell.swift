//
//  CollectionViewCell.swift
//  ZooSoftware
//
//  Created by Hasan Uysal on 20.11.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var keeperName: UILabel!
    @IBOutlet weak var AnimalsName: UILabel!
    
    var keeper: Keeper!
    var animal: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        keeperName.text = keeper.name
        AnimalsName.text = animal
    }

}
