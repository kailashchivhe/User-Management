//
//  UserTableViewCell.swift
//  User Management
//
//  Created by Kailash Chivhe on 20/03/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var typeLabel: UILabel!
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
