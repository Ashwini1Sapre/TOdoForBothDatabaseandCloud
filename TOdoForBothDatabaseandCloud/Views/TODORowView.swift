//
//  TODORowView.swift
//  TOdoForBothDatabaseandCloud
//
//  Created by Knoxpo MacBook Pro on 13/01/21.
//

import SwiftUI

struct TODORowView: View {
    
    var todo: TODOS
    
    var body: some View {
        HStack {
            Text(todo.todo)
            
            Spacer()
            
            if todo.iscomplete == "true" {
                Image(systemName: "checkmark").imageScale(.medium)
            } else {
                Image(systemName: "xmark").imageScale(.medium)
            }
        }
    }
}
