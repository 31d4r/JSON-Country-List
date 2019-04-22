//
//  TableViewCell.swift
//  Countrify
//
//  Created by Eldar Tutnjic on 04/04/2019.
//  Copyright © 2019 eldartutnjic. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
