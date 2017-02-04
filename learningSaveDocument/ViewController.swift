//
//  ViewController.swift
//  learningSaveDocument
//
//  Created by Cage Johnson on 2/3/17.
//  Copyright © 2017 desk. All rights reserved.
//

import UIKit

class ViewController: UINavigationController, UITableViewDelegate, UITableViewDataSource, CrazyViewDelegate {
   


   var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.frame)
        self.view.addSubview(tableView)
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView?.delegate = self
        
    }
    
    
    func resignView(){
        self.dismiss(animated: false, completion: nil)
    }
    
    func findFile(){
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as! String
        var filePath = documentsPath.appending("/file.c")
        print(filePath)
        let file = NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
        if let viewController = file as? CrazyViewControllerWithSave{
            viewController.delegate = self
            self.present(viewController, animated: false, completion: nil)
        }
        
        
    }
    
    
    func pushNewCrazyViewController(){
        var viewController = CrazyViewControllerWithSave()
        viewController.delegate = self
       // self.show(viewController, sender: nil   )
        self.present(viewController, animated: false, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        if(indexPath.row == 0){
            var button = UIButton(type: .system)
            button.frame = CGRect(x: 0, y: 0, width: 400, height: 50)
            button.addTarget(self, action: #selector(ViewController.pushNewCrazyViewController), for: .touchUpInside)
            button.setTitle("new view to save", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            cell.addSubview(button)
            cell.backgroundColor = UIColor.blue; return cell
        }
        
        if(indexPath.row == 1){
            var button = UIButton(type: .system)
            button.frame = CGRect(x: 0, y: 0, width: 400, height: 50)
            button.addTarget(self, action: #selector(ViewController.findFile), for: .touchUpInside)
            button.setTitle("open view", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            cell.addSubview(button)
            cell.backgroundColor = UIColor.blue; return cell
        }
        
        
        return cell
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    

}

