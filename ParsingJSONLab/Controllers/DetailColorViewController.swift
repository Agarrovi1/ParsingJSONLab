//
//  DetailColorViewController.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class DetailColorViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    var color: Colour?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let color = color else {return}
        nameLabel.textColor = .white
        hexLabel.textColor = .white
        redValueLabel.textColor = .white
        greenValueLabel.textColor = .white
        blueValueLabel.textColor = .white
        
        nameLabel.text = color.name.value
        hexLabel.text = color.hex.value
        redValueLabel.text = "Red: \(color.rgb.fraction.r)"
        greenValueLabel.text = "Green: \(color.rgb.fraction.g)"
        blueValueLabel.text = "Blue: \(color.rgb.fraction.b)"
        
        self.view.backgroundColor = color.getUIColor()
        // Do any additional setup after loading the view.
    }
}
