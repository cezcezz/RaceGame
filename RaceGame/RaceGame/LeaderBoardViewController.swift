//
//  LeaderBoardViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

class LeaderBoardViewController: UIViewController {
    
    @IBOutlet var leaderBoard: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var distLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leaderBoard.addShadow()
        nameLabel.addShadow()
        distLabel.addShadow()
    }


}
