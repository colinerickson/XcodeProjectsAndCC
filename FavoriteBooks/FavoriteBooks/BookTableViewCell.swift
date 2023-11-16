//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Colin Erickson on 11/6/23.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!

    func update(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        lengthLabel.text = book.length
    
    }
}
