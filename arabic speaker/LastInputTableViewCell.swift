//
//  LastInputTableViewCell.swift
//  arabic speaker
//
//  Created by Rawan Alsaaran on 12/18/1438 AH.
//  Copyright © 1438 Rawan Alsaaran. All rights reserved.
//

import UIKit

class LastInputTableViewCell: UITableViewCell {

    @IBOutlet var outputLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func commonInit(_ title : String){
        outputLabel.text = title
    }
}
