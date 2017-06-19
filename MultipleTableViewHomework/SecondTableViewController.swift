//
//  SecondTableViewController.swift
//  MultipleTableViewHomework
//
//  Created by Brent Fordham on 6/19/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation
import UIKit

class SecondTableViewController: UITableViewController {
    
    var characters = [PlayerCharacter("Maria"), PlayerCharacter("Antonio"), PlayerCharacter("Balthazaar"), PlayerCharacter("Christophorus"), PlayerCharacter("Todd")]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        let character = characters[indexPath.row]
        
        cell.textLabel?.text = character.name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "characterDetailSegue"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                let characterForDisplay = characters[row]
                let details = segue.destination as! CharacterDetailViewController
                details.currentCharacter = characterForDisplay
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
}
