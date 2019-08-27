//
//  DetailWeatherViewController.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let weather = weather else {return}
        cityNameLabel.text = weather.name
        tempLabel.text = "Temp: \(weather.main.temp)"
        currentWeatherLabel.text = "Weather: \(weather.weather[0].description)"
    }

}
