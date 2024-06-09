//
//  HomeViewController.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/9.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var timerBackgroundView: UIView!
    @IBOutlet weak var timerNumberLabel: UILabel!
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
        
        // set up the timer
        startTimer()
        setupDisplayMode()
        setupTimeFormatMode()
        
        setupContainerView()
        setupGradientBackground()
        setupViewAppearance()
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
    
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            // Update the gradient layer's frame to match the view's bounds
            if let gradientLayer = timerBackgroundView.layer.sublayers?.first as? CAGradientLayer {
                gradientLayer.frame = timerBackgroundView.bounds
            }
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        }
    
    @objc func updateTimeLabel() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.S"
        timerNumberLabel.text = formatter.string(from: Date())
    }
    
    
    func setupContainerView() {
           // Shadow setup on the container view
        timerBackgroundView.layer.shadowColor = UIColor.black.cgColor
        timerBackgroundView.layer.shadowOpacity = 0.6
        timerBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        timerBackgroundView.layer.shadowRadius = 10
       }

       func setupGradientBackground() {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [
               UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1).cgColor, // Lavender
               UIColor(red: 123/255, green: 104/255, blue: 238/255, alpha: 1).cgColor  // MediumSlateBlue
           ]
           gradientLayer.startPoint = CGPoint(x: 0, y: 0)
           gradientLayer.endPoint = CGPoint(x: 1, y: 1)
           gradientLayer.frame = timerBackgroundView.bounds
           timerBackgroundView.layer.insertSublayer(gradientLayer, at: 0)
       }

       func setupViewAppearance() {
           timerBackgroundView.layer.cornerRadius = 15
           timerBackgroundView.layer.masksToBounds = true
       }
    
    deinit {
        timer?.invalidate()
    }
    

}
