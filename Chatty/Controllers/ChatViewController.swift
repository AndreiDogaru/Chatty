//
//  ChatViewController.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 16/04/2021.
//

import UIKit

class ChatViewController: UIViewController {
    var messageList: [Message] = []
    let myUserId = "1"
    var pageTitle: String?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = pageTitle
        
        messageTextField.delegate = self
        
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Constants.MESSAGE_CELL_NIB_NAME, bundle: nil), forCellReuseIdentifier: Constants.MESSAGE_CELL_IDENTIFIER)
        
        loadMessages()
    }
    
    func loadMessages() {
        let tempMsgs = [
            Message(message: "short message", createdAt: "", userId: "2"),
            Message(message: "medium message lashdj adas ha kh dsa dhaskj asdas", createdAt: "", userId: "1"),
            Message(message: "long message lashdj adas ha kh dsa dhaskj asdas as ajksdha shkj a dasdashdkjashkdas asd asdh askjhj asd asdkj akjjkasd asasdbkjashdkj bad bakjbads kjas kj asdabsjk dbaskjdb asda shkdas", createdAt: "", userId: "2"),
        ]
        
        messageList = []
        
        for msg in tempMsgs {
            self.messageList.append(msg)

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.MESSAGE_CELL_IDENTIFIER, for: indexPath) as! MessageCell
        
        cell.messageLabels.forEach({ (label) in
            label.text = self.messageList[indexPath.row].message
        })
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        if messageList[indexPath.row].userId != myUserId {
            cell.leftMessage.isHidden = false
            cell.rightMessage.isHidden = true
        } else {
            cell.leftMessage.isHidden = true
            cell.rightMessage.isHidden = false
        }
        
        return cell
    }
}

// MARK: UITextFieldDelegate

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        createMessage()
        return true
    }
    
    func createMessage() {
        if let messageBody = messageTextField.text {
            let newMsg = Message(message: messageBody, createdAt: String(NSDate().timeIntervalSince1970), userId: myUserId)
            DispatchQueue.main.async {
                self.messageTextField.text = ""
                self.messageTextField.endEditing(true)
                self.messageList.insert(newMsg, at: 0)
                self.tableView.reloadData()
            }
        }
    }
}
