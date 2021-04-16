//
//  ChatViewController.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 16/04/2021.
//

import UIKit

class ChatViewController: UITableViewController {
    
    var pageTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = pageTitle
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
