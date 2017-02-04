//
//  crazyViewToSave.swift
//  learningSaveDocument
//
//  Created by Cage Johnson on 2/3/17.
//  Copyright © 2017 desk. All rights reserved.
//

import Foundation
import UIKit

protocol CrazyViewDelegate {
    func resignView()
}

class CrazyViewControllerWithSave: UIViewController {
    
    var addSquareButton: UIButton!
    var saveButton: UIButton!
    var squares: [Square]!
    var delegate: CrazyViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (squares == nil){
        squares = [Square]()
        }
            
        addSquareButton = UIButton(type: .system)
        addSquareButton.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
        addSquareButton.setTitle("add a crazy square", for: .normal)
        addSquareButton.setTitleColor(UIColor.blue, for: .normal)
        addSquareButton.backgroundColor = UIColor.gray
        addSquareButton.layer.cornerRadius = 10
        addSquareButton.addTarget(self, action: #selector(CrazyViewControllerWithSave.handleAddSquareButtonButton), for: .touchUpInside)
        self.view.addSubview(addSquareButton)
        
        saveButton = UIButton(type: .system)
        saveButton.frame = CGRect(x: 0, y: UIScreen.main.bounds.height-100, width: UIScreen.main.bounds.width, height: 100)
        saveButton.setTitle("save this view", for: .normal)
        saveButton.setTitleColor(UIColor.blue, for: .normal)
        saveButton.backgroundColor = UIColor.gray
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(CrazyViewControllerWithSave.handleSaveButton), for: .touchUpInside)
        self.view.addSubview(saveButton)
        
    }
    
    
    
    func handleSaveButton(){
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as! String
        var filePath = documentsPath.appending("/file.c")
      
        
        NSKeyedArchiver.archiveRootObject(self, toFile: filePath)
        delegate.resignView()
    }
    
    func handleAddSquareButtonButton(){
        var square = Square(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.brown
        squares.append(square)
        self.view.addSubview(square)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(squares)
        aCoder.encode(addSquareButton)
        aCoder.encode(saveButton)
       // aCoder.encode()
    }
 
    
    required init(coder unarchiver: NSCoder){
        super.init(coder: unarchiver)!
        squares = unarchiver.decodeObject() as! [Square]!
        addSquareButton = unarchiver.decodeObject() as! UIButton!
        saveButton = unarchiver.decodeObject() as! UIButton!
    }
    
    init(){
        super.init(nibName: "CrazyViewControllerWithSave", bundle: Bundle.main)
    }
    
    
}
