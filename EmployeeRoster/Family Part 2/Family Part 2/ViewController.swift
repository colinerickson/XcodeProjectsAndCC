//
//  ViewController.swift
//  Family Part 2
//
//  Created by Colin Erickson on 11/13/23.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var selectedFamilyMember: FamilyMember?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let familyMember = selectedFamilyMember else { return }
        
        ageLabel.text = "\(familyMember.age)"
        nameLabel.text = "\(familyMember.name)"
        
        
    }


}

