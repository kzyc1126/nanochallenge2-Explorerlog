//
//  ViewController.swift
//  ExplorerLog
//
//  Created by Kezia Yovita Chandra on 30/04/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    @IBOutlet weak var profileImage: UIImageView!
   public var explorers = [explorersData]()
    var filteredData:[explorersData]!
    @IBOutlet weak var explorersTableView: UITableView!
    @IBOutlet weak var expertiseSegmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    var interest = ["Music","Design","Technology","Culinary","Art"]
    var skills = ["Swift","Photoshop",]
    var selectedindex = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let viewExplorerProfile = storyBoard.instantiateViewController(identifier: "viewExplorer") as viewProfileController
//        viewExplorerProfile.UpdateModalView(explorerData: filteredData[indexPath.row])
//        self.present(viewExplorerProfile, animated: true, completion: nil)
        selectedindex = indexPath.row
        performSegue(withIdentifier: "viewDetail", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = explorersTableView.dequeueReusableCell(withIdentifier:"ExplorerListCell" , for: indexPath) as? ExplorerListCell{
                let exttractedExplorer = filteredData[indexPath.row]
            cell.updateCellView(explorer: exttractedExplorer)
           
            return cell
        }
        else{
            return ExplorerListCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        explorersTableView.delegate = self
        explorersTableView.dataSource = self
        loadJSON()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is viewProfileController{
            let vc = segue.destination as? viewProfileController
            vc?.explorer = filteredData[selectedindex]
            
        }
    }
      @IBAction func expertise(_ sender: Any) {
        searchBar.endEditing(true)
          switch expertiseSegmentedControl.selectedSegmentIndex {
          case 0:
            filteredData = self.explorers.filter {$0.Expertise.contains("Tech")}.sorted(by: {$0.Name < $1.Name})
            explorersTableView.reloadData()
          case 1:
            filteredData = self.explorers.filter {$0.Expertise.contains("Design")}.sorted(by: {$0.Name < $1.Name})
            explorersTableView.reloadData()
          case 2:
            filteredData = self.explorers.filter {$0.Expertise.contains("Domain")}.sorted(by: {$0.Name < $1.Name})
            explorersTableView.reloadData()
          default:
            filteredData = self.explorers.filter {$0.Expertise.contains("Tech")}.sorted(by: {$0.Name < $1.Name})
                explorersTableView.reloadData()
           
          }
        
          
      }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count<=0{
            expertise(expertiseSegmentedControl)
        }
        else{
            expertise(expertiseSegmentedControl)
            filteredData = self.filteredData.filter {
                $0.Name.lowercased().contains(searchText.lowercased())}
            self.explorersTableView.reloadData()

        }
       
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func writeJSON(json:String){
        let filename = getDocumentsDirectory().appendingPathComponent("explorers.json")
        print("filename: \(filename)")
        do {
            try json.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        }
        catch{
            print("gagal save")
        }
    }
    func getDocumentsDirectory()-> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func loadJSON(){
        //ngecek filenya ada apa ga
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let url = NSURL(fileURLWithPath: path)
            if let pathComponent = url.appendingPathComponent("explorers.json") {
                let filePath = pathComponent.path
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath) {
//                    print("FILE AVAILABLE")
                    //decode / isi data
                    do{
                        let data = try Data(contentsOf: pathComponent)
                        let jsonDecoder = JSONDecoder()
                        print(data)
                        let dataFromJSON = try jsonDecoder.decode([explorersData].self, from: data)
                        self.explorers = dataFromJSON
//                        for e in explorers{
//                            e.password = "helloworld"
//                            e.Interest = "BTS"
//                        }
                        // encode data after edited
                        let jsonData = try! JSONEncoder().encode(explorers)
                        let jsonString = String(data: jsonData, encoding: .utf8)!
                        self.explorers = dataFromJSON
                        writeJSON(json: jsonString)
                        filteredData = self.explorers.filter {$0.Expertise.contains("Tech")}.sorted(by: {$0.Name < $1.Name})
                    }
                    catch{
                        print(error)
                    }
                } else {
                    print("No file found")
                    if let fileLocation = Bundle.main.url(forResource: "explorers", withExtension: "json"){
                        print ("location: \(fileLocation)")
                        do{
                            let data = try Data(contentsOf: fileLocation)
                            let jsonDecoder = JSONDecoder()
                            print(data)
                            let dataFromJSON = try jsonDecoder.decode([explorersData].self, from: data)
                            self.explorers = dataFromJSON
                            for e in explorers{
                                e.password = "helloworld"
                                e.Interest = "BTS"
                            }
                            let jsonData = try! JSONEncoder().encode(explorers)
                            let jsonString = String(data: jsonData, encoding: .utf8)!
                            writeJSON(json: jsonString)
                            filteredData = self.explorers.filter {$0.Expertise.contains("Tech")}.sorted(by: {$0.Name < $1.Name})
                        }
                        catch{
                            print(error)
                        }
                    }
                }
            } else {
                print("FILE PATH NOT AVAILABLE")
            }
        
        
        
    }
}


