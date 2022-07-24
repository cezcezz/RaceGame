//
//  SettingsViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var settingLabel: UILabel!
    @IBOutlet var soundValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.settingLabel.addShadow()
        self.soundValueLabel.addShadow()
    }

}
