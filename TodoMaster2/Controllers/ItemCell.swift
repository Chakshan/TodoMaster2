//
//  ItemCell.swift
//  TodoMaster2
//

import UIKit


// Custom table view cell with added labels
class ItemCell: UITableViewCell {

    // Outlets to access task information labels from custom cell
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
