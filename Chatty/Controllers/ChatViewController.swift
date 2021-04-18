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
    let DEFAULT_BOTTOM_VIEW_HEIGHT: CGFloat = 64
    let BOTTOM_VIEW_TOTAL_PADDING: CGFloat = 32 // top + bottom

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var messagePlaceholder: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = pageTitle
        
        messageTextView.delegate = self
        setBorderForTextView()
        
        tableView.dataSource = self
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        tableView.register(UINib(nibName: Constants.MESSAGE_CELL_NIB_NAME, bundle: nil), forCellReuseIdentifier: Constants.MESSAGE_CELL_IDENTIFIER)
        
        loadMessages()
    }

    @IBAction func sendPressed(_ sender: UIButton) {
        createMessage()
    }
}

// MARK: CRUD on messages

extension ChatViewController {
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
    
    func createMessage() {
        if let messageBody = messageTextView.text {
            let newMsg = Message(message: messageBody.trimmingCharacters(in: .whitespacesAndNewlines), createdAt: String(NSDate().timeIntervalSince1970), userId: myUserId)
            DispatchQueue.main.async {
                // UI changes
                self.bottomViewHeight.constant = self.DEFAULT_BOTTOM_VIEW_HEIGHT
                self.messageTextView.text = ""
                self.messageTextView.endEditing(true)
                self.messagePlaceholder.isHidden = false
                self.sendButton.isEnabled = false
                
                // logic changes
                self.messageList.insert(newMsg, at: 0)
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

// MARK: UITextViewDelegate

extension ChatViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count == 0 {
            messagePlaceholder.isHidden = false
            sendButton.isEnabled = false
        } else {
            messagePlaceholder.isHidden = true
            sendButton.isEnabled = textView.text.trimmingCharacters(in: .whitespacesAndNewlines).count != 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if self.messageTextView.contentSize.height != self.bottomViewHeight.constant - self.BOTTOM_VIEW_TOTAL_PADDING {
                UIView.animate(withDuration: 0.1) {
                    self.bottomViewHeight.constant = self.messageTextView.contentSize.height + self.BOTTOM_VIEW_TOTAL_PADDING
                    self.bottomView.layoutIfNeeded()
                }
            }
        }
    }
    
    func setBorderForTextView() {
        messageTextView.layer.cornerRadius = 5
    }
}
