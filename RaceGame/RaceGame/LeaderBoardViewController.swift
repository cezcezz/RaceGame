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
        
        var temp = AlertView()
        temp.frame = CGRect(x: 200, y: 300, width:Int(temp.frame.width), height: Int(temp.frame.height))
        self.view.addSubview(temp)
        
        leaderBoard.addShadow()
        nameLabel.addShadow()
        distLabel.addShadow()
    }
    
    


}
