//
//  EmployeeListTableViewCell.swift
//  CompanySoftware
//
//  Created by Hasan Uysal on 16.11.2022.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
