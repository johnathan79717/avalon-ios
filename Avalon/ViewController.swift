//
//  ViewController.swift
//  Avalon
//
//  Created by Po-Hsiang Hao on 09/12/2017.
//  Copyright © 2017 Po-Hsiang Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var gameID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToGame" {
            let destination = segue.destination as! GameViewController
            destination.playerName = username.text!
            destination.gameID = gameID.text!
        }
    }
}

