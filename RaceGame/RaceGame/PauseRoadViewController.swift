//
//  PauseRoadViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

class PauseRoadViewController: UIViewController {
    
    @IBOutlet var goHomeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapGoHomeButton(){
        let str:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController: ViewController = str.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
        
            self.navigationController?.popToRootViewController(animated: true)

        }
        
        self.goHomeButton.addShadow()
    }
    
    
}
