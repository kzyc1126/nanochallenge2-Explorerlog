//
//  viewProfileController.swift
//  ExplorerLog
//
//  Created by Kezia Yovita Chandra on 05/05/21.
//

import UIKit

class viewProfileController: UIViewController {

    @IBOutlet weak var explorerName: UILabel!
    @IBOutlet weak var explorerPhoto: UIImageView!
    @IBOutlet weak var explorerInterest: UILabel!
    @IBOutlet weak var explorerSkills: UILabel!
    @IBOutlet weak var explorerStatus: UILabel!
    var explorer:explorersData!
    func UpdateModalView(explorerData:explorersData){
        self.explorer = explorerData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        explorerName.text = explorer.Name
        explorerPhoto.image = UIImage(named: explorer.Photo)
        explorerInterest.text = explorer.Interest
        explorerSkills.text = explorer.Skills
        explorerStatus.text = "\(explorer.Expertise) | \(explorer.Shift) | \(explorer.Status) Learner"
        
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
