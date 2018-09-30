//
//  ViewController.swift
//  UndoManager 2
//
//  Created by Prashant G on 9/5/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorViewTwo: UIView!
    
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var view2Button: UIButton!
    @IBOutlet weak var view1Button: UIButton!
    
    var selectedView:String = ""
    
    var colorsArray = ["green","blue","red","black","yellow","brown","orange","purple","cyan","magenta"]
    
    var undoManagerObj1 = UndoManager()
    var undoManagerObj2 = UndoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Settings for undo
        undoManagerObj1.levelsOfUndo = 10
        undoManagerObj2.levelsOfUndo = 10
    }
    
    deinit {
        // perform the deinitialization
        undoManagerObj1.removeAllActions()
        undoManagerObj2.removeAllActions()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redo1(_ sender: Any) {
        undoManagerObj1.redo()
    }
    @IBAction func undo1(_ sender: Any) {
        if (undoManagerObj1.canUndo) {
            undoManagerObj1.undo()
        }
        else{
            print("Sorry, you cannot undo further!")
        }
    }
    
    @IBAction func redo2(_ sender: Any) {
        undoManagerObj2.redo()
    }
    @IBAction func undo2(_ sender: Any) {
        if (undoManagerObj2.canUndo) {
            undoManagerObj2.undo()
        }
        else{
            print("Sorry, you cannot undo further!")
        }
    }
    
    
    func changeColor(color: UIColor) {
        
        let oldColor = self.colorView.backgroundColor ?? UIColor.white
        undoManagerObj1.registerUndo(withTarget: self, handler: { (targetSelf) in
            targetSelf.changeColor(color: oldColor)
        })
        colorView.backgroundColor = color
    }
    
    func changeColorTwo(color: UIColor) {
        
        let oldColor = self.colorViewTwo.backgroundColor ?? UIColor.white
        undoManagerObj2.registerUndo(withTarget: self, handler: { (targetSelf) in
            targetSelf.changeColorTwo(color: oldColor)
        })
        colorViewTwo.backgroundColor = color
    }
    
    
    @IBAction func selectViewToEdit(_ sender: UIButton) {
        if sender.tag == 101 {
            view1Button.layer.borderWidth = 1.0
            view1Button.layer.borderColor = UIColor.gray.cgColor
            selectedView = "view1"
            view2Button.layer.borderWidth = 0.0
            view2Button.layer.borderColor = UIColor.gray.cgColor
        }
        else if sender.tag == 102 {
            view2Button.layer.borderWidth = 1.0
            view2Button.layer.borderColor = UIColor.gray.cgColor
            selectedView = "view2"
            view1Button.layer.borderWidth = 0.0
            view1Button.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let label:UILabel = cell.viewWithTag(101) as! UILabel
        label.text = colorsArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let colorName = colorsArray[indexPath.row]
        
        if selectedView == "view1" {
            switch colorName {
            case "green":
                changeColor(color: UIColor.green)
            case "blue":
                changeColor(color: UIColor.blue)
            case "red":
                changeColor(color: UIColor.red)
            case "black":
                changeColor(color: UIColor.black)
            case "yellow":
                changeColor(color: UIColor.yellow)
            case "brown":
                changeColor(color: UIColor.brown)
            case "orange":
                changeColor(color: UIColor.orange)
            case "purple":
                changeColor(color: UIColor.purple)
            case "cyan":
                changeColor(color: UIColor.cyan)
            case "magenta":
                changeColor(color: UIColor.magenta)
            default:
                changeColor(color: UIColor.white)
            }
        }
        else if selectedView == "view2" {
            switch colorName {
            case "green":
                changeColorTwo(color: UIColor.green)
            case "blue":
                changeColorTwo(color: UIColor.blue)
            case "red":
                changeColorTwo(color: UIColor.red)
            case "black":
                changeColorTwo(color: UIColor.black)
            case "yellow":
                changeColorTwo(color: UIColor.yellow)
            case "brown":
                changeColorTwo(color: UIColor.brown)
            case "orange":
                changeColorTwo(color: UIColor.orange)
            case "purple":
                changeColorTwo(color: UIColor.purple)
            case "cyan":
                changeColorTwo(color: UIColor.cyan)
            case "magenta":
                changeColorTwo(color: UIColor.magenta)
            default:
                changeColorTwo(color: UIColor.white)
            }
        }
        else{
            print("Select view1 or view2")
        }
        
    }
}
