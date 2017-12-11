//
//  BeerTableViewCell.swift
//  31924
//
//  Created by user132969 on 12/1/17.
//  Copyright © 2017 user132969. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var ivBeer: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAlcoholVolume: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
