//
//  ToDo.swift
//  ToDoList
//
//  Created by Colin Erickson on 11/9/23.
//

import UIKit

struct Todo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static func ==(lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
        
    }
    static func loadToDos() -> [Todo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Todo>.self, from: codedToDos)
    }
    static func saveToDos(_ toDos: [Todo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options:  .noFileProtection)
    }
    static func loadSampleToDos() -> [Todo] {
        let toDo1 = Todo(title: "To-Do One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let toDo2 = Todo(title: "To-Do Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let toDo3 = Todo(title: "To-Do Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return [toDo1, toDo2, toDo3]
    }
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
}
