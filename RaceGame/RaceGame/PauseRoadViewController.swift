//
//  PauseRoadViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

class PauseRoadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapGoHomeButton(){
        let str:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController: ViewController = str.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
    ViewController.modalPresentationStyle = .fullScreen
        
        self.present(ViewController, animated: true)
    }

}
