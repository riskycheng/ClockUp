//
//  ActionItem.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/20.
//

import Foundation

struct ActionItem {
    var mainTitle : String = ""
    var dueDate : Date
    var link : String = ""
    var isOutOfDate : Bool {
        return true
    }
    
    init(mainTitle: String, dueDate: Date, link: String) {
        self.mainTitle = mainTitle
        self.dueDate = dueDate
        self.link = link
    }
}
