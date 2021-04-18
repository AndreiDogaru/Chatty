//
//  SettingsRowCell.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 18/04/2021.
//

import UIKit

enum ColorType {
    case gray
    case red
}

class SettingsRowCell: UITableViewCell {
    
    let GRAY_BACKGROUND_COLOR: UIColor = UIColor(named: Constants.Colors.BRAND_GRAY_1)!
    let GRAY_BACKGROUND_COLOR_SELECTED: UIColor = UIColor(named: Constants.Colors.BRAND_GRAY_2)!
    let RED_BACKGROUND_COLOR: UIColor = UIColor(named: Constants.Colors.BRAND_RED_1)!
    let RED_BACKGROUND_COLOR_SELECTED: UIColor = UIColor(named: Constants.Colors.BRAND_RED_2)!
    
    var color: ColorType = ColorType.gray {
        didSet {
            if color == ColorType.red {
                label.textColor = .white
                arrowRight.tintColor = .white
            }
        }
    }

    @IBOutlet weak var row: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var arrowRight: UIImageView!
    @IBOutlet weak var separator: UIView!
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if color == ColorType.red {
            row.backgroundColor = .white
            label.textColor = highlighted ? RED_BACKGROUND_COLOR_SELECTED : RED_BACKGROUND_COLOR
            arrowRight.tintColor = highlighted ? RED_BACKGROUND_COLOR_SELECTED : RED_BACKGROUND_COLOR
        } else {
            row.backgroundColor = highlighted ? GRAY_BACKGROUND_COLOR_SELECTED : GRAY_BACKGROUND_COLOR
            separator.isHidden = true
        }
    }
}
