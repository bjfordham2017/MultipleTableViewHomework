//
//  CharacterDetailViewController.swift
//  MultipleTableViewHomework
//
//  Created by Brent Fordham on 6/19/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    var currentCharacter: PlayerCharacter!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var xpField: UITextField!
    @IBOutlet var stField: UITextField!
    @IBOutlet var dxField: UITextField!
    @IBOutlet var iqField: UITextField!
    @IBOutlet var htField: UITextField!
    @IBOutlet var hpField: UITextField!
    @IBOutlet var fpField: UITextField!
    
    @IBOutlet var addXP: UIButton!
    @IBOutlet var spendXP: UIButton!
    @IBOutlet var addST: UIButton!
    @IBOutlet var addDX: UIButton!
    @IBOutlet var addIQ: UIButton!
    @IBOutlet var addHT: UIButton!
    @IBOutlet var wound: UIButton!
    @IBOutlet var heal: UIButton!
    @IBOutlet var drain: UIButton!
    @IBOutlet var restore: UIButton!
    
    override func loadView() {
        super.loadView()
        
        nameField.text = currentCharacter.name
        nameField.isUserInteractionEnabled = false
        xpField.text = "\(currentCharacter.xp)"
        xpField.isUserInteractionEnabled = false
        stField.text = "\(currentCharacter.strength)"
        stField.isUserInteractionEnabled = false
        dxField.text = "\(currentCharacter.dexterity)"
        dxField.isUserInteractionEnabled = false
        iqField.text = "\(currentCharacter.intelligence)"
        iqField.isUserInteractionEnabled = false
        htField.text = "\(currentCharacter.health)"
        htField.isUserInteractionEnabled = false
        hpField.text = "\(currentCharacter.hitPoints)"
        hpField.isUserInteractionEnabled = false
        fpField.text = "\(currentCharacter.fatiguePoints)"
        fpField.isUserInteractionEnabled = false
        
        addST.isHidden = true
        addDX.isHidden = true
        addIQ.isHidden = true
        addHT.isHidden = true
        
        if currentCharacter.xp < 10 {
            spendXP.isHidden = true
        }
    }
    
    @IBAction func addXP(_ sender: UIButton) {
        currentCharacter.increaseXP(1)
        xpField.text = "\(currentCharacter.xp)"
        
        if currentCharacter.xp > 9 {
            spendXP.isHidden = false
        }
        
    }
    
    @IBAction func spendXP(_ sender: UIButton) {
        addHT.isHidden = false
        addIQ.isHidden = false
        addDX.isHidden = false
        addST.isHidden = false
        
        htField.isHidden = true
        iqField.isHidden = true
        dxField.isHidden = true
        stField.isHidden = true
    }
    
    @IBAction func addST(_ sender: UIButton) {
        currentCharacter.spendXP(on: .str)
        
        addHT.isHidden = true
        addIQ.isHidden = true
        addDX.isHidden = true
        addST.isHidden = true

        htField.isHidden = false
        iqField.isHidden = false
        dxField.isHidden = false
        stField.isHidden = false

        stField.text = "\(currentCharacter.strength)"
        hpField.text = "\(currentCharacter.hitPoints)"
        xpField.text = "\(currentCharacter.xp)"
        
        if currentCharacter.xp < 10 {
            spendXP.isHidden = true
        }
    }
    
    @IBAction func addDX(_ sender: UIButton) {
        currentCharacter.spendXP(on: .dex)
        
        addHT.isHidden = true
        addIQ.isHidden = true
        addDX.isHidden = true
        addST.isHidden = true
        
        htField.isHidden = false
        iqField.isHidden = false
        dxField.isHidden = false
        stField.isHidden = false
        
        dxField.text = "\(currentCharacter.dexterity)"
        xpField.text = "\(currentCharacter.xp)"
        
        if currentCharacter.xp < 10 {
            spendXP.isHidden = true
        }
    }
    
    @IBAction func addIQ(_ sender: UIButton) {
        currentCharacter.spendXP(on: .int)
        
        addHT.isHidden = true
        addIQ.isHidden = true
        addDX.isHidden = true
        addST.isHidden = true
        
        htField.isHidden = false
        iqField.isHidden = false
        dxField.isHidden = false
        stField.isHidden = false
        
        iqField.text = "\(currentCharacter.intelligence)"
        xpField.text = "\(currentCharacter.xp)"
        
        if currentCharacter.xp < 10 {
            spendXP.isHidden = true
        }

    }

    @IBAction func addHT(_ sender: UIButton) {
        currentCharacter.spendXP(on: .hea)
        
        addHT.isHidden = true
        addIQ.isHidden = true
        addDX.isHidden = true
        addST.isHidden = true
        
        htField.isHidden = false
        iqField.isHidden = false
        dxField.isHidden = false
        stField.isHidden = false
        
        htField.text = "\(currentCharacter.health)"
        fpField.text = "\(currentCharacter.fatiguePoints)"
        xpField.text = "\(currentCharacter.xp)"
        
        if currentCharacter.xp < 10 {
            spendXP.isHidden = true
        }

    }
    
    @IBAction func wound(_ sender: UIButton) {
        currentCharacter.wound()
        hpField.text = "\(currentCharacter.hitPoints)"
    }
    
    @IBAction func heal(_ sender: UIButton) {
        currentCharacter.heal()
        hpField.text = "\(currentCharacter.hitPoints)"
    }
    
    @IBAction func drain(_ sender: UIButton) {
        currentCharacter.drain()
        fpField.text = "\(currentCharacter.fatiguePoints)"
    }
    
    @IBAction func restore(_ sender: UIButton) {
        currentCharacter.restore()
        fpField.text = "\(currentCharacter.fatiguePoints)"
    }
    
}
