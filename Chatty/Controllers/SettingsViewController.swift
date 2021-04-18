//
//  SettingsViewController.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 16/04/2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    struct TableItem {
        var text: String
        var color: ColorType
    }
    
    var tableItems: [TableItem] = [
        TableItem(text: "My profile", color: ColorType.gray),
        TableItem(text: "Logout", color: ColorType.red)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.SETTINGS_ROW_CELL_NIB_NAME, bundle: nil), forCellReuseIdentifier: Constants.SETTINGS_ROW_CELL_IDENTIFIER)
    }
}

// MARK: UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SETTINGS_ROW_CELL_IDENTIFIER, for: indexPath) as! SettingsRowCell
        
        cell.label.text = tableItems[indexPath.row].text
        cell.color = tableItems[indexPath.row].color
        
        return cell
    }
}

// MARK: UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
           
        } else if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: Constants.LOGIN_NAVIGATION_CONTROLLER)
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc, .transitionFlipFromTop)
        }
    }
}
