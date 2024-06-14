//
//  ActionListViewController.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/9.
//

import UIKit
import SwiftyGif
class ActionListViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var bottomContentView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var actionListTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the GIF file from assets
        guard let gifData = NSDataAsset(name: "mailbox_anim")?.data else {
            print("GIF file not found in assets")
            return
        }
        do {
            let gif = try UIImage(gifData: gifData)
            headerImageView.setGifImage(gif, loopCount: -1)
            // set it to front
            headerImageView.bringSubviewToFront(bottomContentView)
            headerImageView.bringSubviewToFront(backgroundView)
        } catch {
            print("Error loading GIF: \(error)")
        }
        
        // set the tableView related
        actionListTableView.dataSource = self
        actionListTableView.delegate = self
        
        // register the tableViewCell into this tableView
        actionListTableView.register(ActionListTableViewCell.getNib(), forCellReuseIdentifier: K.ACTION_LIST_REUSE_CELL_IDENTIFIER)
    }
}


extension ActionListViewController : UITableViewDelegate {
    
}

extension ActionListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: K.ACTION_LIST_REUSE_CELL_IDENTIFIER, for: indexPath) as! ActionListTableViewCell
        reuseCell.label_title?.text = "title \(indexPath.row)"
        reuseCell.label_time?.text = "2024-06-\(indexPath.row)"
        return reuseCell
    }
    
    
}
