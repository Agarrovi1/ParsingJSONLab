//
//  ColorViewController.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var colorTableView: UITableView!
    var colors = [Colour]() {
        didSet {
            colorTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    private func loadData() {
        guard let pathToColorJSON = Bundle.main.path(forResource: "colorscheme", ofType: "json") else {
            return print("guard of loadData() didn't work")
        }
        let url = URL(fileURLWithPath: pathToColorJSON)
        do {
            let data = try Data(contentsOf: url)
            let colorsFromJSON = try Colour.getColors(from: data)
            colors = colorsFromJSON
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailColorViewController, let indexPath = colorTableView.indexPathForSelectedRow else {return}
        destination.color = colors[indexPath.row]
    }
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let theColor = colors[indexPath.row]
        cell.textLabel?.text = theColor.name.value
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = theColor.getUIColor()
        return cell
    }
}
