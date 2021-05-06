//
//  ExplorerListCellTableViewCell.swift
//  ExplorerLog
//
//  Created by Kezia Yovita Chandra on 04/05/21.
//

import UIKit

class ExplorerListCell: UITableViewCell {
    @IBOutlet weak var explorersPhoto: UIImageView!
    @IBOutlet weak var explorersName: UILabel!
    @IBOutlet weak var explorersSkills: UILabel!
    @IBOutlet weak var explorersInterest: UILabel!
    func updateCellView(explorer: explorersData){
        explorersName.text = explorer.Name
        explorersSkills.text = explorer.Skills
        explorersInterest.text = explorer.Interest
        explorersPhoto.image = UIImage(named: explorer.Photo)
        explorersPhoto.layer.cornerRadius = 10
        explorersPhoto.layer.maskedCorners=[.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        
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
