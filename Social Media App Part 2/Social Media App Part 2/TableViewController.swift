//
//  TableViewController.swift
//  Social Media App Part 2
//
//  Created by Colin Erickson on 11/15/23.
//

import UIKit

class TableViewController: UITableViewController {
    var posts: [Post] = [
        Post(title: "First post!", bodyText: "Hi guys, this is my first post!!", date: "12/25/2017", user: "Gerald997", comments: 3),
        Post(title: "I went to Switzerland.", bodyText: "Took a quick trip to Switzerland.", date: "2/5/23", user: "Traveler23", comments: 7),
        Post(title: "Exploring the Mountains", bodyText: "Hiking in the Alps was an amazing experience!", date: "3/10/23", user: "NatureExplorer", comments: 12),
        Post(title: "Cooking Adventures", bodyText: "Tried a new recipe today and it turned out delicious!", date: "4/22/23", user: "ChefLife", comments: 5),
        Post(title: "Coding Journey", bodyText: "Started learning Swift programming. It's challenging but fun!", date: "5/15/23", user: "CodeNewbie", comments: 2),
        Post(title: "Beach Sunset", bodyText: "Enjoying a beautiful sunset by the ocean.", date: "6/8/23", user: "SunsetLover", comments: 8),
        Post(title: "Book Recommendations", bodyText: "Just finished an amazing book! Any recommendations for the next one?", date: "7/1/23", user: "Bookworm", comments: 4),
        Post(title: "Fitness Challenge", bodyText: "Completed my 30-day fitness challenge. Feeling accomplished!", date: "8/12/23", user: "FitLife", comments: 6),
        Post(title: "Weekend Getaway", bodyText: "Spent the weekend in a cozy cabin in the woods.", date: "9/4/23", user: "WeekendExplorer", comments: 10),
        Post(title: "Gaming Marathon", bodyText: "Had an epic gaming marathon with friends. Victory Royale!", date: "10/17/23", user: "Gamer123", comments: 15)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postList", for: indexPath)
        let post = posts[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = post.title
        config.secondaryText = post.bodyText
        cell.contentConfiguration = config

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "PostPage") as? DetailTableViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
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

}
