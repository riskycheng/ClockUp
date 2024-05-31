//
//  MainActionViewController.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/5/31.
//

import UIKit

class MainActionViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
    }
    

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        }
    
    @objc func updateTimeLabel() {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss.S"
            timeLabel.text = formatter.string(from: Date())
    }
    
    deinit {
        timer?.invalidate()
    }

}
