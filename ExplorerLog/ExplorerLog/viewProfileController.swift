//
//  viewProfileController.swift
//  ExplorerLog
//
//  Created by Kezia Yovita Chandra on 05/05/21.
//

import UIKit

class viewProfileController: UIViewController {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = teamCollectionView.dequeueReusableCell(withReuseIdentifier: "teamViewCell", for: IndexPath) as! teamViewCell
//        cell.setupCollectionView(with:explorer)
//
//
//    }
    

    @IBOutlet weak var explorerName: UILabel!
    @IBOutlet weak var explorerPhoto: UIImageView!
    @IBOutlet weak var explorerInterest: UILabel!
    @IBOutlet weak var explorerSkills: UILabel!
    @IBOutlet weak var explorerStatus: UILabel!
    @IBOutlet weak var teamCollectionView: UICollectionView!
    var explorer:explorersData!
    var explorers:[explorersData]!
    var team:[explorersData]!
    func UpdateModalView(explorerData:explorersData,explorers:[explorersData]){
        self.explorer = explorerData
        self.explorers = explorers
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        explorerName.text = explorer.Name
        explorerPhoto.image = UIImage(named: explorer.Photo)
        explorerInterest.text = explorer.Interest
        explorerSkills.text = explorer.Skills
        explorerStatus.text = "\(explorer.Expertise) | \(explorer.Shift) | \(explorer.Status) Learner"
//        teamCollectionView.dataSource = self
//        teamCollectionView.delegate = self
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
