//
//  K.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/14.
//

import Foundation

class K {
    static let ACTION_LIST_REUSE_CELL_NIB_NAME = "ActionListTableViewCell"
    static let ACTION_LIST_REUSE_CELL_IDENTIFIER = "reusable_tableCellIdentifier"
    
    
    static func simulateData(number count : Int) -> [ActionItem] {
        var actions : [ActionItem] = []
        
        actions.append(ActionItem(mainTitle: "京东｜茅台", dueDate: Date(), link: "https://www.jd.com"))
        actions.append(ActionItem(mainTitle: "天猫｜茅台", dueDate: Date(), link: "https://www.tmall.com"))
        actions.append(ActionItem(mainTitle: "苏宁｜茅台", dueDate: Date(), link: "https://www.suning.com"))
        actions.append(ActionItem(mainTitle: "京东｜iPhone 15", dueDate: Date(), link: "https://www.jd.com"))
        actions.append(ActionItem(mainTitle: "京东｜vivo X fold 3 Pro", dueDate: Date(), link: "https://www.jd.com"))
        actions.append(ActionItem(mainTitle: "京东｜Lenovo笔记本", dueDate: Date(), link: "https://www.jd.com"))
        actions.append(ActionItem(mainTitle: "拼多多｜Xiaomi 14 Ultra", dueDate: Date(), link: "https://www.jd.com"))
        
        return actions
    }
}
