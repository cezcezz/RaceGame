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
        let LeaderBoardViewController: LeaderBoardViewController = str.instantiateViewController(withIdentifier: "LeaderBoardViewController") as! LeaderBoardViewController
        
        LeaderBoardViewController.modalPresentationStyle = .fullScreen
        LeaderBoardViewController.modalTransitionStyle = .crossDissolve
        
        self.present(LeaderBoardViewController, animated: true)
    }
    
    @IBAction func didTapSettingsViewController(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SettingsViewController: SettingsViewController = str.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        SettingsViewController.modalPresentationStyle = .fullScreen
        SettingsViewController.modalTransitionStyle = .crossDissolve
        
        self.present(SettingsViewController, animated: true)
    }
    
    @IBAction func didTapRoadViewController(){
        let str: UIStoryboard = UIStoryboard(name: "Road", bundle: nil)
        let RoadViewController: RoadViewController = str.instantiateViewController(withIdentifier: "RoadViewController") as! RoadViewController
        
        RoadViewController.modalPresentationStyle = .fullScreen
        RoadViewController.modalTransitionStyle = .crossDissolve
        
        self.present(RoadViewController, animated: true)
    }

}

