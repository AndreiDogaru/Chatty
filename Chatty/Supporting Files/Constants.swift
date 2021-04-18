//
//  Constants.swift
//  Chatty
//
//  Created by Andrei Dogaru-Serban on 16/04/2021.
//

import Foundation

struct Constants {
    // view names
    static let LOGIN_NAVIGATION_CONTROLLER = "LoginNavigationController"
    static let TAB_BAR_CONTROLLER = "TabBarController"
    
    // navigation
    static let CHAT_LIST_TO_CHAT_IDENTIFIER = "openChat"

    // cell names and identifiers
    static let CHAT_LIST_CELL_IDENTIFIER = "ChatListCell"
    static let CHAT_LIST_CELL_NIB_NAME = "ChatListCell"
    
    static let MESSAGE_CELL_IDENTIFIER = "MessageCell"
    static let MESSAGE_CELL_NIB_NAME = "MessageCell"
    
    static let SETTINGS_ROW_CELL_IDENTIFIER = "SettingsRowCell"
    static let SETTINGS_ROW_CELL_NIB_NAME = "SettingsRowCell"
    
    // colors
    struct Colors {
        static let BRAND_GRAY_1 = "brandGray1"
        static let BRAND_GRAY_2 = "brandGray2"
        
        static let BRAND_RED_1 = "brandRed1"
        static let BRAND_RED_2 = "brandRed2"
        
        static let PRIMARY_BLUE = "primaryBlue"
    }
}
