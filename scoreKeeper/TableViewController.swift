//
//  TableViewController.swift
//  scoreKeeper
//
//  Created by Colin Erickson on 11/16/23.
//

import UIKit

class TableViewController: UITableViewController, DetailTableViewControllerDelegate {

    var players: [Player] = [Player(name: "Colin", score:1)]
    var player: Player?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func unwindToTableViewController(unwindSegue: UIStoryboardSegue) {
        print("players: ", players)
        guard let triggeringTableView = unwindSegue.source as? DetailTableViewController
        else {
            return
        }
//        if let unwrappedNewPlayer = newPlayer {
        let newPlayer = triggeringTableView.newPlayer
        if let unwrappedNewPlayer = newPlayer {
            
            players.append(unwrappedNewPlayer)
        }
            
//        }
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    @IBAction func addPlayerTapped(_ sender: Any) {
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailTableViewController") as? DetailTableViewController {
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerScoreCell", for: indexPath) as! TableViewCell
        let currentPlayer = players[indexPath.row]
        cell.playerNameLabel.text = currentPlayer.name
        cell.playerScoreLabel.text = "\(currentPlayer.score)"
        cell.stepper.addTarget(cell, action: #selector(cell.stepperValueChanged(_:)), for: .valueChanged)

        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func didAddPlayer(_ player: Player) {
        players.append(player)
        tableView.reloadData()
    }

}
