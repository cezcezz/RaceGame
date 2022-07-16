//
//  RoadViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

//class CarMetod {
//    var xPos: Int = 0
//
//    func swipeLeft() -> Void{
//        self.xPos -= 106
//        if self.xPos < Int(self.view.frame.width)/2 - 48 - 10 - 96 {
//            self.xPos = Int(self.view.frame.width)/2 - 48 - 10 - 96
//        } else if self.xPos > Int(self.view.frame.width)/2 + 48 + 10 + 96{
//            self.xPos = Int(self.view.frame.width)/2 + 48 + 10 + 96
//        }
//        return
//    }
//
//    func swipeRight()->Void{
//        self.xPos += 106
//        if self.xPos < Int(self.view.frame.width)/2 - 48 - 10 - 96 {
//            self.xPos = Int(self.view.frame.width)/2 - 48 - 10 - 96
//        } else if self.xPos > Int(self.view.frame.width)/2 + 48 + 10 + 96{
//            self.xPos = Int(self.view.frame.width)/2 + 48 + 10 + 96
//        }
//        return
//
//    }
//
//    func getXPos() -> Int {
//        return self.xPos
//    }
//
//    init(xPos: Int){
//        if self.xPos < Int(self.view.frame.width)/2 - 48 - 10 - 96 {
//            self.xPos = Int(self.view.frame.width)/2 - 48 - 10 - 96
//        } else if self.xPos > Int(self.view.frame.width)/2 + 48 + 10 + 96{
//            self.xPos = Int(self.view.frame.width)/2 + 48 + 10 + 96
//        }
//    }
//}

class RoadViewController: UIViewController {

    var imageView: UIImageView!
    let car = UIImage(named: "car")
   // var carMet: CarMetod = CarMetod.init(xPos: 0)
    var xPosit: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let didSwipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        didSwipeLeft.direction = .left
        self.view.addGestureRecognizer(didSwipeLeft)
        
        let didSwipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        didSwipeRight.direction = .right
        self.view.addGestureRecognizer(didSwipeRight)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageView = UIImageView(frame: CGRect(x: Int(self.view.frame.width)/2 - 48 , y: Int(self.view.frame.height) - 96 - 48, width: 96, height: 96))
        imageView!.image = car
        imageView!.contentMode = .scaleToFill
        self.view.addSubview(imageView!)
        
        xPosit = Int(self.view.frame.width)/2 - 48
       // carMet.xPos = xPosit
        
        let firstOasisStrip: UIView = UIView(frame: CGRect(x: (Int(self.view.frame.width)/2 - 48 - 6), y: 0, width: 2, height: Int(self.view.frame.height)))
        firstOasisStrip.backgroundColor = .black
        self.view.addSubview(firstOasisStrip)
        
        let secondOasisStrip: UIView = UIView(frame: CGRect(x: (Int(self.view.frame.width)/2 + 48 + 4), y: 0, width: 2, height: Int(self.view.frame.height)))
        secondOasisStrip.backgroundColor = .black
        self.view.addSubview(secondOasisStrip)
    }
   
    @IBAction func didTapPauseButton(){
        let str: UIStoryboard = UIStoryboard(name: "Road", bundle: nil)
        if let pauseRoadViewController: PauseRoadViewController = str.instantiateViewController(withIdentifier: "PauseRoadViewController") as? PauseRoadViewController{
            self.navigationController?.pushViewController(pauseRoadViewController, animated: true)
        }
    }

    @objc func swipeLeft(){
       xPosit -= 106
        UIView.animate(withDuration: 0.3, animations: {
            if self.xPosit < Int(self.view.frame.width)/2 - 48 - 10 - 96 {
                self.xPosit = Int(self.view.frame.width)/2 - 48 - 10 - 96
            }

           //self.carMet.swipeLeft()
            self.imageView.frame = CGRect(x: self.xPosit, y: Int(self.view.frame.height) - 96 - 48, width: 96, height: 96)
        }, completion: {_ in
            print("Completed")
        })
    }
    
    @objc func swipeRight(){
       // self.carMet.swipeRight()
        xPosit += 106
        
        UIView.animate(withDuration: 0.3, animations: {
            if self.xPosit > Int(self.view.frame.width)/2 + 48 + 15 {
                self.xPosit = Int(self.view.frame.width)/2 + 48 + 11
                
            }

            self.imageView.frame = CGRect(x: self.xPosit , y: Int(self.view.frame.height) - 96 - 48, width: 96, height: 96)
        }, completion: {_ in print("Completed")
        })
        
        
        
    }
    

}
