//
//  ViewController.swift
//  Boxes
//
//  Created by Alex on 06.02.16.
//  Copyright © 2016 oleksii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttonBoxes: [UIButton]!
    
    var boxes = [Box]()

    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    func fillBoxes() {
        var array = Constants.mainParameters.array
        for _ in 1...Constants.mainParameters.count {
            let num = array.chooseOne()
            boxes.append(Box(number: num, isVisiable: true))
            array.removeObject(num)
        }
    }
    
    func showBoxes(boxes: [Box]) {
        for (index, box) in boxes.enumerate() {
            if let buttonInd = buttonBoxes.indexOf({$0.tag == index}) {
                let button = buttonBoxes[buttonInd]
                button.setTitle(String(box.number), forState: UIControlState.Normal)
            }
        }
    }
    
    func showAllButtons() {
        for button in buttonBoxes {
            button.hidden = false
        }
    }
    
    func startGame() {
        fillBoxes()
        showBoxes(boxes)
        showAllButtons()
    }
    
    @IBAction func pressButton(sender: UIButton) {
        print(sender.tag)
        sender.hidden = true
        boxes.removeFirst()
        if boxes.isEmpty {
            startGame()
        }
    }
}

