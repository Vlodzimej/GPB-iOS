//
//  ViewController.swift
//  16-UIKit
//
//  Created by Владимир Амелькин on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum TimerState {
        case launched
        case stopped
    }
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    private var seconds = 0
    private var minutes = 0
    
    private var timer: Timer?
    private var timerState: TimerState = .stopped

    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        timerState = .launched
        createTimer()
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timerState = .stopped
        invalidateTimer()
    }
    
    func createTimer() {
        guard timerState == .launched else { return }
        timer = Timer(timeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.increaseTimer()
            self.updateTimerLabel()
        }
        
        guard let timer = timer else { return }
        RunLoop.main.add(timer, forMode: .common)
        print("Timer is launched")
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        print("Timer is invalidated")
    }
    
    private func increaseTimer() {
        seconds += 1
        if seconds == 60 {
            seconds = 0
            minutes += 1
        }
    }
    
    private func updateTimerLabel() {
        let secondText = getTimeText(seconds)
        let minuteText = getTimeText(minutes)
        
        timerLabel.text = "\(minuteText):\(secondText)"
        
        func getTimeText(_ value: Int) -> String {
            value < 10 ? "0\(value)" : "\(value)"
        }
    }
}

