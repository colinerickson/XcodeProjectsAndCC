//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Colin Erickson on 10/12/23.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var ageTextField: UITextField!
    
    @IBOutlet var leagueTextField: UITextField!
    
    @IBOutlet var teamTextField: UITextField!
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
updateView()
        // Do any additional setup after loading the view.
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let league = leagueTextField.text,
              let team = teamTextField.text else {return}
            
       athlete = Athlete(name: name, age: age
                         , league: league, team: team)
        
        performSegue(withIdentifier: "segueForm", sender: self)
        
    }
    
    
    func updateView(){
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = "\(athlete.age)"
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        } else {

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
