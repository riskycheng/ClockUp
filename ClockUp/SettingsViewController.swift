//
//  SettingsViewController.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/9.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var headerSettingsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the GIF file from assets
        guard let gifData = NSDataAsset(name: "gears_anim")?.data else {
            print("GIF file not found in assets")
            return
        }
        do {
            let gif = try UIImage(gifData: gifData)
            headerSettingsImageView.setGifImage(gif, loopCount: -1)
        } catch {
            print("Error loading GIF: \(error)")
        }
        
    }

}
