//
//  ViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

