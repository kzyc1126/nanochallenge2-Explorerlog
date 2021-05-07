//
//  teamViewCell.swift
//  ExplorerLog
//
//  Created by Kezia Yovita Chandra on 07/05/21.
//

import UIKit

class teamViewCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    func setupCollectionView(with team:explorersData){
        teamImage.image = UIImage(named: team.Photo)
        teamName.text = team.Team
    }
}
