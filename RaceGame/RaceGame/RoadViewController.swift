//
//  RoadViewController.swift
//  RaceGame
//
//  Created by Cezar_ on 6.07.22.
//

import UIKit

class ImageY{
    var image = UIImageView()
    var yCordinate = Int()
    
    init (image: UIImageView,yCordinate: Int) {
        self.image = image
        self.yCordinate = yCordinate
    }
    
    func getXCor() -> CGFloat{
        return self.image.frame.minX
    }
    func getYCor() -> Int{
        self.yCordinate = Int(self.image.frame.minY)
        return self.yCordinate
    }
}

extension UILabel{
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 2
        //self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        //self.layer.shouldRasterize = true
        //self.layer.rasterizationScale = UIScreen.main.scale
    }
}

extension UIButton{
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 2
    }
}

extension UILabel{
    func addCorner() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 14
    }
}

enum lineControl: CaseIterable{
    case leftLine
    case middleLine
    case rightLine
    
    func getLine(mainView: UIView) -> CGRect{
        switch self {
        case .leftLine:
            return CGRect(x: Int(mainView.frame.width)/2 - 48 - 10 - 96 , y: Int(mainView.frame.height) - 96 - 48, width: 96, height: 96)
        case .middleLine:
           return CGRect(x: Int(mainView.frame.width)/2 - 48 , y: Int(mainView.frame.height) - 96 - 48, width: 96, height: 96)
        case .rightLine:
          return  CGRect(x: Int(mainView.frame.width)/2 + 48 + 10 , y: Int(mainView.frame.height) - 96 - 48, width: 96, height: 96)
        }
    }
    
    func getLineBarrier(mainView: UIView, yCor: Int) -> CGRect{
        switch self {
        case .leftLine:
            return CGRect(x: Int(mainView.frame.width)/2 - 48 - 10 - 96 , y: yCor, width: 96, height: 96)
        case .middleLine:
           return CGRect(x: Int(mainView.frame.width)/2 - 48 , y: yCor, width: 96, height: 96)
        case .rightLine:
          return  CGRect(x: Int(mainView.frame.width)/2 + 48 + 10 , y: yCor, width: 96, height: 96)
        }
    }
}

class RoadViewController: UIViewController {
    
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var pauseButton: UIButton!
    
    var score: Int = 0
    var timer = Timer()

    var imageView = UIImageView()
    let car = UIImage(named: "car")
    var arrayImageView = [ImageY]()
  //  var copyView = UIView()
   // var carMet: CarMetod = CarMetod.init(xPos: 0)
    
    var position: lineControl = .middleLine
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let didSwipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        didSwipeLeft.direction = .left
        self.view.addGestureRecognizer(didSwipeLeft)
        
        let didSwipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        didSwipeRight.direction = .right
        self.view.addGestureRecognizer(didSwipeRight)
        
        self.pauseButton.addShadow()
        self.scoreLabel.addShadow()
        self.scoreLabel.addCorner()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageView.frame = position.getLine(mainView: self.view)
        imageView.image = car
        imageView.contentMode = .scaleToFill
        imageView.layer.zPosition = 1
        self.view.addSubview(imageView)
      
       // carMet.xPos = xPosit
        
        let firstOasisStrip: UIView = UIView(frame: CGRect(x: (Int(self.view.frame.width)/2 - 48 - 6), y: Int(scoreLabel.frame.maxY), width: 2, height: Int(self.view.frame.height)))
        firstOasisStrip.backgroundColor = .black
        self.view.addSubview(firstOasisStrip)
        
        let secondOasisStrip: UIView = UIView(frame: CGRect(x: (Int(self.view.frame.width)/2 + 48 + 4), y: Int(scoreLabel.frame.maxY), width: 2, height: Int(self.view.frame.height)))
        secondOasisStrip.backgroundColor = .black
        self.view.addSubview(secondOasisStrip)
        
        scoreLabel.backgroundColor = .systemGray2
        scoreLabel.textColor = .systemGray6
        scoreLabel.layer.zPosition = 1
        self.scoreLabel.text = "Your score: \(self.score)"
        
        let myString = "Your score:"
        let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.blue ]
        let myAttrString = NSAttributedString(string: myString + String(self.score), attributes: myAttribute)
        self.scoreLabel.attributedText = myAttrString
        
        
     //   copyView = self.view
        var yCor: Int = 20
        startedGameTimer(yCord: yCor,mainView: self.view )
    }
   
    @IBAction func didTapPauseButton(){
        let str: UIStoryboard = UIStoryboard(name: "Road", bundle: nil)
        if let pauseRoadViewController: PauseRoadViewController = str.instantiateViewController(withIdentifier: "PauseRoadViewController") as? PauseRoadViewController{
            self.navigationController?.pushViewController(pauseRoadViewController, animated: true)
        }
    }
    
    func didIntersect(timerr: Timer){
        let explosion = UIImage(named: "explosion")
        self.imageView.image = explosion
        self.imageView.contentMode = .scaleToFill
        timerr.invalidate()
    }
    
    func startedGameTimer(yCord: Int, mainView: UIView){
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.04,
            repeats: true,
            block: {timer in
                
                    if Int.random(in: 1...70) == 1{
                        var tempImageView = UIImageView()
                        let barrier = UIImage(named: "log")
                        tempImageView.frame = lineControl.allCases.randomElement()?.getLineBarrier(mainView: mainView, yCor: yCord) ?? CGRect(x: Int(self.view.frame.width)/2 - 48 , y: yCord, width: 62, height: 35)
                        tempImageView.image = barrier
                        tempImageView.clipsToBounds = true
                        tempImageView.backgroundColor = .systemGray6
                        tempImageView.layer.cornerRadius = 35
                        tempImageView.contentMode = .scaleToFill
                        var tempImageY: ImageY = ImageY(image: tempImageView, yCordinate: 20)
                        self.arrayImageView.append(tempImageY)
                        self.view.addSubview(tempImageView)
                    }
                
                for i in self.arrayImageView{
//Intersect
                    if i.image.frame.intersects(self.imageView.frame) {
                        self.didIntersect(timerr: timer)
                    }
                    
                    if Int(i.image.frame.minY) >= Int(self.view.frame.height){
                        i.image.removeFromSuperview()
                        self.arrayImageView.removeFirst()
                        self.score += 1
                        self.scoreLabel.text = "Your score: \(self.score)"
                    }
                    
                    i.yCordinate += 6
                    let xCor = Int(i.image.frame.minX)
                    UIView.animate(withDuration: 0.041, delay: 0, animations: {
                        i.image.frame = CGRect(x: xCor, y: i.yCordinate, width: 96, height: 96)
                    })
                   
                }
            })
    }

    @objc func swipeLeft(){
        
        if position == .rightLine {
            position = .middleLine
        } else if position == .middleLine{
            position = .leftLine
        } else if position == .leftLine{
            position = .leftLine
        }
        
    
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.frame = self.position.getLine(mainView: self.view)
        }, completion: {_ in
            print("Completed")
        })
    }
    
    @objc func swipeRight(){
       
        if position == .leftLine{
            position = .middleLine
        } else if position == .middleLine{
            position = .rightLine
        } else if position == .rightLine{
            position = .rightLine
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.frame = self.position.getLine(mainView: self.view)
        }, completion: {_ in
            print("Completed")
        })
    }
    
}
