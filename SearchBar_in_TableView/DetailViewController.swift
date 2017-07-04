//
//  DetailViewController.swift
//  SearchBar_in_TableView
//
//  Created by mac on 04/07/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var dataModel : Model!
    
    @IBOutlet weak var img_ImageView: UIImageView!
    
    @IBOutlet weak var lbl_ImageName: UILabel!
    
    @IBOutlet weak var lbl_ImageTY: UILabel!
    
    @IBOutlet weak var lbl_ImageTB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        img_ImageView.image = UIImage(named: dataModel.imageName)
        lbl_ImageTB.text = dataModel.imageBy
        lbl_ImageTY.text = dataModel.imageYear
        lbl_ImageName.text = dataModel.imageName
    }
}

