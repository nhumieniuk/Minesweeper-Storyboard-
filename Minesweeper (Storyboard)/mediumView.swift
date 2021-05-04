//
//  mediumView.swift
//  Minesweeper (Storyboard)
//
//  Created by Student on 5/3/21.
//

import Foundation
import UIKit
class mediumView: UIViewController {
    
    var mediumSquares = [Int](repeating: 0, count: 256)
    var flag = false
    var yIncrement = 0.0
    var index = 0
    var squaresTapped = 0
    
    override func viewDidLoad() {
        randomMines()
        calculateNumberedSquares()
        printGrid()
        flagButton()
    }
    
    func printGrid(){
        for square in mediumSquares
        {
            let placedSquare = UIButton(frame: CGRect(x:((index % 16) * (Int(UIScreen.main.bounds.size.width) / 16)) + 3, y: (Int(UIScreen.main.bounds.size.height / 3)) + Int(yIncrement) * (Int(UIScreen.main.bounds.size.width) / 16), width: (Int(UIScreen.main.bounds.size.width) / 16), height: (Int(UIScreen.main.bounds.size.width) / 16)))
            yIncrement += 0.0625
            index += 1
            placedSquare.backgroundColor = UIColor.darkGray
            placedSquare.layer.borderWidth=1
            placedSquare.layer.borderColor = UIColor.black.cgColor
            placedSquare.tag = square
            placedSquare.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
            self.view.addSubview(placedSquare)
        }
    }
    
    func flagButton()
    {
        let flagButton = UIButton(frame:CGRect(x: UIScreen.main.bounds.size.width/2 - 25, y: UIScreen.main.bounds.size.height/8, width: 50, height: 50))
        flagButton.backgroundColor = UIColor.lightGray
        flagButton.layer.borderWidth = 2
        flagButton.layer.borderColor = UIColor.black.cgColor
        flagButton.setTitle("💣", for: .normal)
        flagButton.addTarget(self, action: #selector(flagButtonTapped), for: .touchUpInside)
        self.view.addSubview(flagButton)
    }
    
    func randomMines()
    {
        var i = 0 // index for each square in array
        var mines = 40 // amount of mines in medium mode
        while(mines > 0) // until mines are all done generating
        {
            if(mediumSquares[i % 256] == 0)
                {
                let random = Int.random(in: 0...256) //random chance (<15%)
                if(random == 1)
                {
                    mediumSquares[i % 256] = 9 // 9 means bomb
                    mines -= 1
                }
                i += 1
            }
            else{
                i += 1
            }
        }
    }
    
    func calculateNumberedSquares() //really gross code for looking at adjacent tiles (looking for more elegant solution?)
    {
        for i in 0 ..< mediumSquares.count
        {
            if mediumSquares[i] >= 9
            {
               
                if i > 0 && i < 16 // if i is a top edge square
                {
                    mediumSquares[i + 1] += 1
                    mediumSquares[i - 1] += 1
                    mediumSquares[i + 15] += 1
                    mediumSquares[i + 16] += 1
                    mediumSquares[i + 17] += 1
                }
                else
                    if i % 16 == 0 && i != 240 && i != 0// if i is a left edge square
                    {
                        mediumSquares[i - 16] += 1
                        mediumSquares[i - 15] += 1
                        mediumSquares[i + 1] += 1
                        mediumSquares[i + 16] += 1
                        mediumSquares[i + 17] += 1
                    }
                    else if i % 16 == 15 && i != 255// if i is a right edge square
                {
                    mediumSquares[i - 17] += 1
                    mediumSquares[i - 16] += 1
                    mediumSquares[i - 1] += 1
                    mediumSquares[i + 15] += 1
                    mediumSquares[i + 16] += 1
                }
                else if i > 240 && i < 256 //if i is a bottom edge square
                {
                    mediumSquares[i - 17] += 1
                    mediumSquares[i - 16] += 1
                    mediumSquares[i - 15] += 1
                    mediumSquares[i + 1] += 1
                    mediumSquares[i - 1] += 1
                }
                else if i == 0 || i == 16 || i == 240 || i == 255 //if i is a corner square
                {
                    if i == 0
                    {
                        mediumSquares[i + 1] += 1
                        mediumSquares[i + 16] += 1
                        mediumSquares[i + 17] += 1
                    }
                    if i == 16
                    {
                        mediumSquares[i + 15] += 1
                        mediumSquares[i - 1] += 1
                        mediumSquares[i + 16] += 1
                    }
                    if i == 240
                    {
                        mediumSquares[i - 15] += 1
                        mediumSquares[i + 1] += 1
                        mediumSquares[i - 16] += 1
                    }
                    if i == 255
                    {
                        mediumSquares[i - 17] += 1
                        mediumSquares[i - 1] += 1
                        mediumSquares[i - 16] += 1
                    }
                }
                else // if none of those satisfy the if statements (center squares) execute this
                {
                    mediumSquares[i - 17] += 1
                    mediumSquares[i - 16] += 1
                    mediumSquares[i - 15] += 1
                    mediumSquares[i + 1] += 1
                    mediumSquares[i - 1] += 1
                    mediumSquares[i + 15] += 1
                    mediumSquares[i + 16] += 1
                    mediumSquares[i + 17] += 1
                }
            }
    }
    }
    
    @objc func squareTapped(sender: UIButton){
        
        if(flag == false){
            if(sender.currentTitle == nil){
        if(sender.tag >= 9){
            loseGame()
            sender.backgroundColor = UIColor.red
        }
        if(sender.tag > 0 && sender.tag < 9){
            sender.setTitle(String(sender.tag), for: .normal)
        }
        if(sender.backgroundColor != UIColor.lightGray)
        {
            squaresTapped += 1
        }
        if(squaresTapped == 216 && sender.tag < 9)
        {
            winGame()
        }
            sender.backgroundColor = UIColor.lightGray
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
    
    @objc func flagButtonTapped(sender: UIButton){
        if(flag == true)
        {
            sender.setTitle("💣", for: .normal)
            flag = false
        }
        else{
            sender.setTitle("🚩", for: .normal)
            flag = true
        }
    }
    
    func loseGame()
    {
        index = 0
        yIncrement = 0
        //code for losing the game here
        for square in mediumSquares
        {
            let placedSquare = UIButton(frame: CGRect(x:((index % 16) * (Int(UIScreen.main.bounds.size.width) / 16)) + 3, y: (Int(UIScreen.main.bounds.size.height / 3)) + Int(yIncrement) * (Int(UIScreen.main.bounds.size.width) / 16), width: (Int(UIScreen.main.bounds.size.width) / 16), height: (Int(UIScreen.main.bounds.size.width) / 16)))
            index += 1
            yIncrement += 0.0625
            if(square >= 9)
            {
                placedSquare.backgroundColor = UIColor.red
                placedSquare.layer.borderWidth=1
                placedSquare.layer.borderColor = UIColor.black.cgColor
                placedSquare.setTitle("💣", for: .normal)
                self.view.addSubview(placedSquare)
            }
        }
        let alert = UIAlertController(title: "You lost...", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Play again", style: .default) {_ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    func winGame()
    {
        let alert = UIAlertController(title: "You won!", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Play again", style: .default) {_ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    
        
        
}
