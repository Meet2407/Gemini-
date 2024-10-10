//
//  GeminiTableViewCell.swift
//  Gemini
//
//  Created by Meet Kapadiya on 11/09/24.
//

import UIKit

class GeminiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var geminiOne: UILabel!
    @IBOutlet weak var geminiTwo: UILabel!
    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var bgviewTwo: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
