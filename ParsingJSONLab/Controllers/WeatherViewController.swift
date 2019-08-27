//
//  ViewController.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherTableView: UITableView!
    var weathers = [Weather]() {
        didSet {
            weatherTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        guard let pathToWeatherJSON = Bundle.main.path(forResource: "weather", ofType: "json") else {
            return print("guard of loadData() in weather didn't work")
        }
        let url = URL(fileURLWithPath: pathToWeatherJSON)
        do {
            let data = try Data(contentsOf: url)
            let weathersFromJSON = try Weather.getWeathers(from: data)
            weathers = weathersFromJSON
        } catch {
            print(error)
        }
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        cell.textLabel?.text = weathers[indexPath.row].name
        return cell
    }
    
    
}
