//
//  ViewController.swift
//  Minesweeper (Storyboard)
//
//  Created by Student on 4/23/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var easy = false
    var medium = false
    var hard = false
    var easySquares = [Bool](repeating: false, count: 64)
    var mediumSquares = [Bool](repeating: false, count: 256)
    var hardSquares = [Bool](repeating: false, count: 480)
    
    @IBAction func easyButton(_ sender: UIButton) {
        easy = true
    }
    @IBAction func mediumButton(_ sender: UIButton) {
        medium = true
    }
    @IBAction func hardButton(_ sender: UIButton) {
        hard = true
    }
    
    func randomMines()
    {
        if(easy)
        {
            var mines = 10
            while(mines > 0)
            {
                    var i = 0
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
            while(mines > 0)
            {
                    var i = 0
                    if(easySquares[i % 255] == false)
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
            while(mines > 0)
            {
                    var i = 0
                    if(easySquares[i % 479] == false)
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

