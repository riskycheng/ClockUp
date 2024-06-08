//
//  ActionListViewController.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/9.
//

import UIKit

class ActionListViewController: UIViewController {

    @IBOutlet weak var BtnAllActions: UIButton!
    var isBtnAllActionsSelected : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func BtnAllActionsClicked(_ sender: Any) {
        if isBtnAllActionsSelected {
            
            var config = BtnAllActions.configuration
            config?.background.backgroundColor = UIColor.gray
            BtnAllActions.configuration = config
            
            
            isBtnAllActionsSelected = false
            print("deselect allActions")
        } else {
            
            var config = BtnAllActions.configuration
            config?.background.backgroundColor = UIColor.systemGreen
            BtnAllActions.configuration = config
            
            isBtnAllActionsSelected = true
            print("select allActions")
        }
    }

}
