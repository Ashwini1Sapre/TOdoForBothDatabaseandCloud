//
//  TODOS.swift
//  TOdoForBothDatabaseandCloud
//
//  Created by Knoxpo MacBook Pro on 13/01/21.
//

import Foundation
import FirebaseDatabase
import FirebaseFirestore

struct TODOS:Identifiable{
    
    let ref: DatabaseReference?
    let key: String
    let todo: String
    let iscomplete: String
    let id: String
    
    
    
    
    init(todo: String, iscomplete: String, key: String = "") {
        self.ref = nil
        self.key = key
        self.todo = todo
        self.iscomplete = iscomplete
        self.id = key
    }
    
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let todo = value["todo"] as? String,
            let isComplete = value["isComplete"] as? String
            else {
                return nil
            }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.todo = todo
        self.iscomplete = isComplete
        self.id = snapshot.key
        
    }
    
    func toAnyObject() -> Any {
        return [
            "todo": todo,
            "isComplete": iscomplete,
            
        ]
    }
    
    
    
    
    
    
}
