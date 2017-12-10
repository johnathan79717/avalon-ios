//
//  GameViewController.swift
//  Avalon
//
//  Created by Po-Hsiang Hao on 09/12/2017.
//  Copyright © 2017 Po-Hsiang Hao. All rights reserved.
//

import UIKit
import Firebase

class GameViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        print(cell)
        print(playerArray, indexPath.row)
        cell.playerNameLabel.text = playerArray[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var playersTableView: UITableView!
    var db = DatabaseReference()
    
    var playerName = ""
    var gameID = ""
    var playerArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Database.database().reference().child(gameID)
        playersTableView.dataSource = self

        // Do any additional setup after loading the view.
        
        db.child("players").childByAutoId().setValue(["name": playerName])
        db.child("players").observe(.value) { (snapshot) in
            print(snapshot.value)
            let dict = snapshot.value as? [String: [String: String]]
            if dict != nil {
                self.playerArray = Array(dict!.keys)
                self.playersTableView.reloadData()
                print(self.playerArray)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
