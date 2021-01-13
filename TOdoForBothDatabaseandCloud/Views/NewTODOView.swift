//
//  NewTODOView.swift
//  TOdoForBothDatabaseandCloud
//
//  Created by Knoxpo MacBook Pro on 13/01/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore
struct NewTODOView: View {
    
    @State private var newTODO = ""
    
    @ObservedObject var session = FirebaseSession()
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("TODO:")
                    TextField("Enter TODO", text: $newTODO)
                        .padding()
                }
                Button(action: {
                    self.addTODO()
                }) {
                    Text("Add")
                }
            }
        }
        .padding()
    }
    
    func addTODO() {
        if !newTODO.isEmpty {
            
            
            //Add on cloude
            let ref = Firestore.firestore().document("list/new")
            
            let addrow : [String: Any] = [
                "todonew": newTODO]
            
            ref.setData(addrow) { (error) in
                if let error = error {
                    print("\(error.localizedDescription)")
                }
                else{
                    
                    print("dtata save")
                }
                
                
                
            }
            
            
            
            //Add TODO to Firebase
            session.uploadTODO(todo: newTODO)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTODOView_Previews: PreviewProvider {
    static var previews: some View {
        NewTODOView()
    }
}
