//
//  ActionListTableViewCell.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/14.
//

import UIKit

class ActionListTableViewCell: UITableViewCell {

    @IBOutlet weak var label_title: UILabel!
    @IBOutlet weak var label_tag: UILabel!
    @IBOutlet weak var label_link: UILabel!
    @IBOutlet weak var label_time: UILabel!
    
    static func getNib() ->UINib {
        return UINib(nibName: K.ACTION_LIST_REUSE_CELL_NIB_NAME, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
