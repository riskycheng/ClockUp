//
//  HomeViewController.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/9.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerHomeImageView: UIImageView!
    
    @IBOutlet weak var displayModeBtn: UIButton!
    @IBOutlet weak var timeFormatBtn: UIButton!
    
    var timer: Timer?
    
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
        timeFormatBtn.showsMenuAsPrimaryAction = true
        timeFormatBtn.changesSelectionAsPrimaryAction = true
        timeFormatBtn.menu = UIMenu(children: [
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
    
    
    deinit {
        timer?.invalidate()
    }
    

}
