//
//  RoadViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

class RoadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapPauseButton(){
        let str: UIStoryboard = UIStoryboard(name: "Road", bundle: nil)
        let PauseRoadViewController: PauseRoadViewController = str.instantiateViewController(withIdentifier: "PauseRoadViewController") as! PauseRoadViewController
        
        self.present(PauseRoadViewController, animated: true)
    }


}
