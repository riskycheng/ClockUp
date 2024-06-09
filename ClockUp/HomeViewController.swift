//
//  HomeViewController.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/9.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerHomeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the GIF file from assets
        guard let gifData = NSDataAsset(name: "stopwatch_anim")?.data else {
            print("GIF file not found in assets")
            return
        }
        do {
            let gif = try UIImage(gifData: gifData)
            headerHomeImageView.setGifImage(gif, loopCount: -1)
        } catch {
            print("Error loading GIF: \(error)")
        }
    }
    

}
