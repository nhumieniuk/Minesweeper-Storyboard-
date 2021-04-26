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
    var easySquares = [Bool](repeating: false, count: 64)
    var mediumSquares = [Bool](repeating: false, count: 256)
    var hardSquares = [Bool](repeating: false, count: 480)
    var yIncrement = 0.0
    var index = 0
    
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
        randomMines()
        printGrid()
    }
    
    
    
    
    
    
    
    
    func printGrid()
    {
        //prints a grid
        for square in easySquares
        {
            index += 1
            let placedSquare = UIView(frame: CGRect(x: 100 + ((index % 8) * 10), y: 100 + Int(yIncrement) * 10, width: 10, height: 10))
            yIncrement += 0.125
            if(square == false){
            placedSquare.backgroundColor=UIColor.lightGray
            placedSquare.layer.borderWidth=1
            placedSquare.layer.borderColor = UIColor.black.cgColor
            self.view.addSubview(placedSquare)
            }
            else
            {
                placedSquare.backgroundColor=UIColor.red
                placedSquare.layer.borderWidth=1
                placedSquare.layer.borderColor = UIColor.black.cgColor
                self.view.addSubview(placedSquare)
            }
            
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
                    if(easySquares[i % 63] == false)
                    {
                        i += 1
                        let random = Int.random(in: 1...64)
                        if(random == 1)
                        {
                            easySquares[i % 63] = true
                            mines -= 1
                        }
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
                    
                    if(mediumSquares[i % 255] == false)
                    {
                        i += 1
                        let random = Int.random(in: 1...256)
                        if(random == 1)
                        {
                            mediumSquares[i % 255] = true
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
                    
                    if(hardSquares[i % 479] == false)
                    {
                        i += 1
                        let random = Int.random(in: 1...480)
                        if(random == 1)
                        {
                            hardSquares[i % 479] = true
                            mines -= 1
                        }
                    }
                    else{
                        i += 1
                    }
            }
            
        }
    }
}

