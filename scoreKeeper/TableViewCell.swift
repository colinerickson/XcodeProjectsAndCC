//
//  TableViewCell.swift
//  scoreKeeper
//
//  Created by Colin Erickson on 11/16/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        playerScoreLabel.text = "\(Int(sender.value))"
        
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
