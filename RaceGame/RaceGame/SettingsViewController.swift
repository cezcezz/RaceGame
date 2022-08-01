//
//  SettingsViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

enum ColorCar{
    case carRed
    case carOrange
    case carGrey
    
    
    func setImage() -> String{
        switch self{
        case .carRed:
            return "carRed"
        case .carOrange:
            return "carOrange"
        case .carGrey:
            return "carGrey"
        }
    }
}

class SettingsViewController: UIViewController {

    @IBOutlet var settingLabel: UILabel!
    var carExemple: ColorCar = .carRed
    
    var roadVC = RoadViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       

        
        self.settingLabel.addShadow()
    }
    
    @IBAction func didSelectColorCar(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
            print("0")
            carExemple = .carRed
            roadVC.car = UIImage(named: "carRed")
        case 1:
            print("1")
            carExemple = .carOrange
            roadVC.car = UIImage(named: "carOrange")
        case 2:
            print("2")
            carExemple = .carGrey
            roadVC.car = UIImage(named: "carGrey")
        default:
            break
        }
    }
    
}
