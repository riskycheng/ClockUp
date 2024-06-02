//
//  MainActionViewController.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/5/31.
//

import UIKit

class MainActionViewController: UIViewController {

    @IBOutlet weak var displayModeBtn: UIButton!
    @IBOutlet weak var timerFormatModeBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
        
        //setupDisplayMode()
        
        //setupTimeFormatMode()
    }
    
    func setupDisplayMode() {
        displayModeBtn.showsMenuAsPrimaryAction = true
        displayModeBtn.changesSelectionAsPrimaryAction = true
        displayModeBtn.menu = UIMenu(children: [
            UIAction(title: "时钟", handler: { action in
                print("selected 时钟")
            }),
            UIAction(title: "刷新率", handler: { action in
                print("selected 刷新率")
            }),
            UIAction(title: "实时网速", handler: { action in
                print("selected 实时网速")
            })
        ])
    }
    
    func setupTimeFormatMode() {
        timerFormatModeBtn.showsMenuAsPrimaryAction = true
        timerFormatModeBtn.changesSelectionAsPrimaryAction = true
        timerFormatModeBtn.menu = UIMenu(children: [
            UIAction(title: "时:分:秒:毫秒", handler: { action in
                print("selected 时:分:秒:毫秒")
            }),
            UIAction(title: "分:秒:毫秒", handler: { action in
                print("selected 分:秒:毫秒")
            }),
            UIAction(title: "秒:毫秒", handler: { action in
                print("selected 秒:毫秒")
            }),
            UIAction(title: "毫秒", handler: { action in
                print("selected 毫秒")
            })
        ])
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
