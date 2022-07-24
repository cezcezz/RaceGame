//
//  ViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var leaderBoardButton: UIButton!
    @IBOutlet var settingsButton: UIButton!
    @IBOutlet var playButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.nameLabel.addShadow()
        
        self.leaderBoardButton.addShadow()
        self.settingsButton.addShadow()
        self.playButton.addShadow()
    }

    @IBAction func didTapLeadersBoardViewController(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let leaderBoardViewController: LeaderBoardViewController = str.instantiateViewController(withIdentifier: "LeaderBoardViewController") as? LeaderBoardViewController{
     
        self.navigationController?.pushViewController(leaderBoardViewController, animated: true)
        }
    }
    
    @IBAction func didTapSettingsViewController(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let settingsViewController: SettingsViewController = str.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController{
   
        self.navigationController?.pushViewController(settingsViewController, animated: true)
        }
    }
    @IBAction func didTapRoadViewController(){
        let str: UIStoryboard = UIStoryboard(name: "Road", bundle: nil)
        if let roadViewController: RoadViewController = str.instantiateViewController(withIdentifier: "RoadViewController") as? RoadViewController{
        
        
        self.navigationController?.pushViewController(roadViewController, animated: true)
        }
    }

    
    
    
}

