//
//  ChatListViewController.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 16/04/2021.
//

import UIKit

class ChatListViewController: UITableViewController {
    var chatList: [Chat] = [
        Chat(profilePicture: "", username: "Andrei Dogaru", lastMessage: "Ok, talk to you later then :) ", createdAt: "2 hrs ago"),
        Chat(profilePicture: "", username: "Vanessa Deak", lastMessage: "No", createdAt: "2 days ago"),
    ]
    
    var chatPageTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Constants.CHAT_LIST_CELL_NIB_NAME, bundle: nil), forCellReuseIdentifier: Constants.CHAT_LIST_CELL_IDENTIFIER)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CHAT_LIST_CELL_IDENTIFIER, for: indexPath) as! ChatListCell
        
        cell.username.text = chatList[indexPath.row].username
        cell.lastMessage.text = chatList[indexPath.row].lastMessage
        cell.createdAt.text = chatList[indexPath.row].createdAt
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chatPageTitle = chatList[indexPath.row].username
        self.performSegue(withIdentifier: Constants.CHAT_LIST_TO_CHAT_IDENTIFIER, sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.CHAT_LIST_TO_CHAT_IDENTIFIER {
            if let title = chatPageTitle {
                let vc = segue.destination as! ChatViewController
                vc.pageTitle = title
            }
        }
    }
}
