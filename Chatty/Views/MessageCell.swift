//
//  MessageCell.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 16/04/2021.
//

import UIKit

enum Alignment {
    case right
    case left
}

class MessageCell: UITableViewCell {

    @IBOutlet var messageLabels: [UILabel]!
    @IBOutlet weak var leftMessage: UIView!
    @IBOutlet weak var rightMessage: UIView!
}
