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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the GIF file from assets
        guard let gifData = NSDataAsset(name: "plants_anim")?.data else {
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
    }
}
