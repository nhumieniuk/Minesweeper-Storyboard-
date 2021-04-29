//
//  ViewController.swift
//  Minesweeper (Storyboard)
//
//  Created by Student on 4/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    var easy = false
    var medium = false
    var hard = false
    var easySquares = [Int](repeating: 0, count: 64)
    var mediumSquares = [Int](repeating: 0, count: 256)
    var hardSquares = [Int](repeating: 0, count: 480)
    var flag = false
    var yIncrement = 0.0
    var index = 0
    private var placedSquare: UIButton!
    @IBAction func easyButton(_ sender: UIButton) {
        easy = true
    }
    @IBAction func mediumButton(_ sender: UIButton) {
        medium = true
    }
    @IBAction func hardButton(_ sender: UIButton) {
        hard = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        easy = true
        flag = true
        randomMines()
        calculateNumberedSquares()
        printGrid()
        
    }
    
    
    
    
    
    
    
    
    func printGrid()
    {
        
        //prints a grid
        for square in easySquares
        {
            let placedSquare = UIButton(frame: CGRect(x: 10 + ((index % 8) * 30), y: 100 + Int(yIncrement) * 30, width: 30, height: 30))
            if(easySquares[index] >= 9)
            {
            print("mine at " + String(index))
            }
            yIncrement += 0.125
            index += 1
            placedSquare.backgroundColor = UIColor.darkGray
            placedSquare.layer.borderWidth=1
            placedSquare.layer.borderColor = UIColor.black.cgColor
            placedSquare.tag = square
            placedSquare.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
            self.view.addSubview(placedSquare)
        }
    }
    
    func randomMines()
    {
        if(easy)
        {
            var i = 0
            var mines = 10
            while(mines > 0)
            {
                if(easySquares[i % 64] == 0)
                {
                    let random = Int.random(in: 1...64)
                    if(random == 1)
                    {
                        easySquares[i % 64] = 9 // 9 means bomb
                        mines -= 1
                        print(i)
                    }
                    i += 1
                }
                else{
                    i += 1
                }
            }
        }
        
        
        if(medium)
        {
            var mines = 40
            var i = 0
            while(mines > 0)
            {
                
                if(mediumSquares[i % 255] == 0)
                {
                    i += 1
                    let random = Int.random(in: 1...256)
                    if(random == 1)
                    {
                        mediumSquares[i % 255] = 9 //bomb = 9
                        mines -= 1
                    }
                }
                else{
                    i += 1
                }
            }
            
        }
        if(hard)
        {
            var mines = 99
            var i = 0
            while(mines > 0)
            {
                
                if(hardSquares[i % 479] == 0)
                {
                    i += 1
                    let random = Int.random(in: 1...480)
                    if(random == 1)
                    {
                        hardSquares[i % 479] = 9 //bomb = 9
                        mines -= 1
                    }
                }
                else{
                    i += 1
                }
            }
            
        }
    }
    func calculateNumberedSquares() //this is hardcoded and im not satisfied with this but it'll do for now
    {
        //1,2,3,4,5,6,7,8,15,16,23,24,31,32,39,40,47,48,53,57,58,59,60,61,62
        //0, 7, 56, 63
        for i in 0 ..< easySquares.count
        {
            if easySquares[i] >= 9
            {
               
                if i == 1 || i == 2 || i == 3 || i == 4 || i == 5 || i == 6 // if i is a top edge square
                {
                    easySquares[i + 1] += 1
                    easySquares[i - 1] += 1
                    easySquares[i + 7] += 1
                    easySquares[i + 8] += 1
                    easySquares[i + 9] += 1
                }
                else
                    if i == 8 || i == 16 || i == 24 || i == 32 || i == 40 || i == 48 // if i is a left edge square
                    {
                        easySquares[i - 8] += 1
                        easySquares[i - 7] += 1
                        easySquares[i + 1] += 1
                        easySquares[i + 8] += 1
                        easySquares[i + 9] += 1
                    }
                    else if i == 15 || i == 23 || i == 31 || i == 39 || i == 47 || i == 55 // if i is a right edge square
                {
                    easySquares[i - 9] += 1
                    easySquares[i - 8] += 1
                    easySquares[i - 1] += 1
                    easySquares[i + 7] += 1
                    easySquares[i + 8] += 1
                }
                else if i == 57 || i == 58 || i == 59 || i == 60 || i == 61 || i == 62 //if i is a bottom edge square
                {
                    easySquares[i - 9] += 1
                    easySquares[i - 8] += 1
                    easySquares[i - 7] += 1
                    easySquares[i + 1] += 1
                    easySquares[i - 1] += 1
                }
                else if i == 0 || i == 7 || i == 56 || i == 63 //if i is a corner square
                {
                    if i == 0
                    {
                        easySquares[i + 1] += 1
                        easySquares[i + 8] += 1
                        easySquares[i + 9] += 1
                    }
                    if i == 7
                    {
                        easySquares[i + 7] += 1
                        easySquares[i - 1] += 1
                        easySquares[i + 8] += 1
                    }
                    if i == 56
                    {
                        easySquares[i - 7] += 1
                        easySquares[i + 1] += 1
                        easySquares[i - 8] += 1
                    }
                    if i == 63
                    {
                        easySquares[i - 9] += 1
                        easySquares[i - 1] += 1
                        easySquares[i - 8] += 1
                    }
                }
                else // if none of those satisfy the if statements (center squares) execute this
                {
                    easySquares[i - 9] += 1
                    easySquares[i - 8] += 1
                    easySquares[i - 7] += 1
                    easySquares[i + 1] += 1
                    easySquares[i - 1] += 1
                    easySquares[i + 7] += 1
                    easySquares[i + 8] += 1
                    easySquares[i + 9] += 1
                }
            }
            
        }
        
    }
    
    func loseGame()
    {
        index = 0
        yIncrement = 0
        //code for losing the game here
        for square in easySquares
        {
            
            let placedSquare = UIButton(frame: CGRect(x: 10 + ((index % 8) * 30), y: 100 + Int(yIncrement) * 30, width: 30, height: 30))
            index += 1
            yIncrement += 0.125
            if(square >= 9)
            {
                placedSquare.backgroundColor = UIColor.red
                placedSquare.layer.borderWidth=1
                placedSquare.layer.borderColor = UIColor.black.cgColor
                placedSquare.setTitle("💣", for: .normal)
                self.view.addSubview(placedSquare)
            }
        }
        print("lose")
    }
    @objc func squareTapped(sender: UIButton){
        if(flag == false){
        sender.backgroundColor = UIColor.lightGray
        if(sender.tag >= 9){
            loseGame()
            sender.backgroundColor = UIColor.red
        }
        if(sender.tag > 0 && sender.tag < 9){
            sender.setTitle(String(sender.tag), for: .normal)
        }
        }
        else{
            if(sender.backgroundColor == UIColor.darkGray)
            {
                if(sender.currentTitle == nil){
                sender.setTitle("🚩", for: .normal)
                }
                else{
                    sender.setTitle(nil, for: .normal)
                }
            }
        }
    }
}

