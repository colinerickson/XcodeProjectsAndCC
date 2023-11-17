//
//  DetailTableViewController.swift
//  scoreKeeper
//
//  Created by Colin Erickson on 11/16/23.
//

import UIKit
protocol DetailTableViewControllerDelegate: AnyObject {
    func didAddPlayer(_ player: Player)
}

class DetailTableViewController:
    UITableViewController {
    
    weak var delegate: DetailTableViewControllerDelegate?
    var newPlayer: Player?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func prepare(for segue: UIStoryboardSegue!, sender: (Any)?) {
        if segue.identifier == "unwindToTable" {
            print("update Data")
            
            newPlayer = Player(name: nameTextField.text!, score: Int(scoreTextField.text ?? "0") ?? 0)
            print(newPlayer)
            delegate?.didAddPlayer(newPlayer!)
        } else {
            print("don't update data")
        }
    }
    
//    @IBAction func saveButtonTapped(_ sender: Any) {
        
        
//        if let navigationController = navigationController {
//            if let playerListVC = navigationController.viewControllers.first as? TableViewController {
//                playerListVC.players.append(newPlayer!)
//                playerListVC.tableView.reloadData()
//            }
//
//        }
//    }
}
