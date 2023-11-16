//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Colin Erickson on 10/13/23.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var ham = Food(name: "Ham", description: "Is from a pig")
    var frenchFries = Food(name: "French Fries", description: "They are fried potatoe slices")
    var chickenTenders = Food(name: "Chicken Tenders", description: "They are slices of chicken breast that are breaded and then fried.")
    
    var meals: [Meal] {
        var breakfast = Meal(name: , food: [])
        var lunch = Meal(name: "lunch", food: [])
        var dinner = Meal(name: "dinner", food: [])
        return [breakfast, lunch, dinner]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Any additional setup after loading the view.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        // Configure the cell...
        let meal = meals[indexPath.section]
        var content = cell.defaultContentConfiguration()
        content.text = "\(meal.name)"
        content.secondaryText = "\(meal.food)"
        cell.contentConfiguration = content
        return cell
    }

}
