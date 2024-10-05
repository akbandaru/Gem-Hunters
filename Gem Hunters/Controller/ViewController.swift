//
//  ViewController.swift
//  Gem Hunters
//
//  Created by Akhilesh Bandaru on 2024-04-29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = Timer()
    let gemTime: Double = 1.0
    var gameBrain: GameBrain? = nil
    var score: Int = 0
    var player: AVAudioPlayer!
    var imageName: String = ""
    
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var gemButton1: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gemImageView1: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleDescriptionLabel: UILabel!
//    var device: UIDevice = UIDevice.current
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(device.name)
        let window = UIApplication.shared.windows[0]
        let safeFrame = window.safeAreaLayoutGuide.layoutFrame
        let topHeight: CGFloat = safeFrame.minY
        let bottomHeight: CGFloat = safeFrame.maxY - scoreLabel.frame.origin.y
       centering()
        gameBrain = GameBrain(x_coordinate: [0.0, mainView.frame.width - gemImageView1.frame.width], y_coordinate: [topHeight, safeFrame.maxY - bottomHeight - gemImageView1.frame.height])

    }
    @IBAction func gemCollector(_ sender: UIButton) {
            // Gets rid of the title and description
            titleLabel.text = ""
            titleDescriptionLabel.text = ""
            // Reset the timer
            timer.invalidate()
            
            score += gameBrain!.getScore()
            scoreLabel.text = "Score: \(score)"
            // Changing the position of the button
            let random_x: CGFloat = gameBrain!.getXcoord()
            let random_y: CGFloat = gameBrain!.getYcoord()
            gemButton1.frame = CGRectMake(random_x, random_y, CGFloat(gameBrain!.width), CGFloat(gameBrain!.height))
            // Changing the position of the ImageView
            gemImageView1.frame = CGRectMake(random_x, random_y, CGFloat(gameBrain!.width), CGFloat(gameBrain!.height))
            imageName = gameBrain!.getImage()
            gemImageView1.image = UIImage(imageLiteralResourceName: imageName)
            // Music jingle
            playSound(soundName: gameBrain?.gemTune.randomElement() ?? "Diamond")
            timer = Timer.scheduledTimer(timeInterval: gameBrain!.getTime(), target: self, selector: #selector(update), userInfo: nil, repeats: true)
            
    }
    @objc func update()
    {
        // Assigning random x and y values
        let random_x = gameBrain!.getXcoord()
        let random_y = gameBrain!.getYcoord()
        // Changing the position of the button
        gemButton1.frame = CGRectMake(random_x, random_y, CGFloat(gameBrain!.width), CGFloat(gameBrain!.height))
            // Changing the position of the ImageView
        gemImageView1.frame = CGRectMake(random_x, random_y, CGFloat(gameBrain!.width), CGFloat(gameBrain!.height))
    }
    func centering()
    {
        gemButton1.frame.origin.x = (mainView.frame.maxX)/2 - (gemButton1.frame.height)/2
        gemButton1.frame.origin.y = (mainView.frame.maxY)/2 - (gemButton1.frame.height)/2
        gemImageView1.frame.origin.x = (mainView.frame.maxX)/2 - (gemImageView1.frame.height)/2
        gemImageView1.frame.origin.y = (mainView.frame.maxY)/2 - (gemImageView1.frame.height)/2
    }
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

