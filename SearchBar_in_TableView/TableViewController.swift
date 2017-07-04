//
//  TableViewController.swift
//  SearchBar_in_TableView
//
//  Created by mac on 04/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

enum selectedScop:Int{
    case name = 0
    case year = 1
    case by = 2
}

class TableViewController: UITableViewController , UISearchBarDelegate {

//    let initialDataAry:[Model] = Model.generateModelArray()
    var dataAry:[Model] = Model.generateModelArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.searchBarSetup()
    }
    
    //MARK: - Setup SearchBar and Segmented View
    func searchBarSetup() {
        //MARK:- SearchBar on TableView
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
        //MARK:- SegmentView on TableView
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name","Year","By"]
        searchBar.selectedScopeButtonIndex = 1
    }

    //MARK:- SearchBar Delegat method
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.isEmpty {
            dataAry = Model.generateModelArray()
            self.tableView.reloadData()
        }else{
            filterTableview(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    //MARK:- Create function for filterTableView
    
    func filterTableview(ind: Int, text: String){
        switch ind{
        case selectedScop.name.rawValue:
            dataAry = dataAry.filter({ (mod) -> Bool in
                return mod.imageName.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScop.by.rawValue:
            dataAry = dataAry.filter({ (mod) -> Bool in
                return mod.imageBy.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScop.year.rawValue:
            dataAry = dataAry.filter({ (mod) -> Bool in
                return mod.imageYear.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        default:
            print("no type")
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataAry.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        
        let model = dataAry[indexPath.row]
        cell.lbl_PhotoName.text = model.imageName
        cell.lbl_PhotoTY.text = model.imageYear
        cell.lbl_PhotoTB.text = model.imageBy
        cell.img_ImageView.image = UIImage(named:model.imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.dataModel = dataAry[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
