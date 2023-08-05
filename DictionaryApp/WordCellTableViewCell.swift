//
//  WordCellTableViewCell.swift
//  DictionaryApp
//
//  Created by Merve Nur Nerkis on 4.08.2023.
//

import UIKit

class WordCellTableViewCell: UITableViewCell {

    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var turkishLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
