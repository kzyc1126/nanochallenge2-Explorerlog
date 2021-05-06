//
//  ExplorerData.swift
//  ExplorerLog
//
//  Created by Kezia Yovita Chandra on 04/05/21.
//

import Foundation
class explorersData: Codable{
    var Name: String
    var Photo: String
    var Expertise:String
    var Team: String
    var Shift: String
    var Skills: String
    var Interest: String
    var Status: String
    var password: String?
    
    init(Name: String,Photo: String,Expertise:String,Team:String,Shift:String,Skills:String,Interest:String,Status:String,password:String?){
        self.Name = Name
        self.Photo = Photo
        self.Expertise = Expertise
        self.Team = Team
        self.Shift = Shift
        self.Skills = Skills
        self.Interest = Interest
        self.Status = Status
        self.password = password
    
    }
}
