//
//  DetailUserViewController.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class DetailUserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var dobLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else {return}
        nameLabel.text = user.getFullName()
        addressTextView.text = user.getFullAddress()
        dobLabel.text = user.dob.date
        // Do any additional setup after loading the view.
    }
    

}
