//
//  TableViewCell.swift
//  SearchBar_in_TableView
//
//  Created by mac on 04/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var img_ImageView: UIImageView!
    @IBOutlet weak var lbl_PhotoName: UILabel!
    @IBOutlet weak var lbl_PhotoTY: UILabel!
    @IBOutlet weak var lbl_PhotoTB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
