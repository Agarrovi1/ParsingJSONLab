//
//  UserViewController.swift
//  ParsingJSONLab
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var users = [User]() {
        didSet {
            userTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    private func loadData() {
        guard let pathToUserJSON = Bundle.main.path(forResource: "randomuser", ofType: "json") else {
            return print("guard of loadData() for users didn't work")
        }
        let url = URL(fileURLWithPath: pathToUserJSON)
        do {
            let data = try Data(contentsOf: url)
            let usersFromJSON = try User.getUsers(from: data)
            users = usersFromJSON
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailUserViewController, let indexPath = userTableView.indexPathForSelectedRow else {return}
        destination.user = users[indexPath.row]
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let theUser = users[indexPath.row]
        cell.textLabel?.text = theUser.getFullName()
        cell.detailTextLabel?.text = theUser.email
        return cell
    }
    
    
}
