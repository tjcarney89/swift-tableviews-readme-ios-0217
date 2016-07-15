//
//  TableViewController.swift
//  TableViewFunTime
//
//  Created by James Campagno on 6/15/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var favoriteSongs: [String] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        generateFavoriteSongs()
        
    }
    
    func generateFavoriteSongs() {

        favoriteSongs = [
            "Thriller",
            "Never Gonna Give You Up",
            "Safety Dance",
            "Space Oddity",
            "Smells Like Teen Spirit",
            "Jealous Guy",
            "Jolene",
            "Moondance",
            "Stairway To Heaven",
            "One",
            "Life On Mars?"
        ]
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favoriteSongs.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)

        let favoriteSong = favoriteSongs[indexPath.row]
        
        cell.textLabel?.text = favoriteSong

        return cell
    }
 

}
