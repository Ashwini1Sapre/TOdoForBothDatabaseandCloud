//
//  SignUp.swift
//  TOdoForBothDatabaseandCloud
//
//  Created by Knoxpo MacBook Pro on 13/01/21.
//

import SwiftUI

struct SignUp: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var session: FirebaseSession
    
    
    var body: some View {
        
        Group{
            VStack{
            HStack{
               Text("Email")
                TextField("enter email address",text: $email)
            }
            .padding()
            HStack{
                
                Text("Password")
                TextField("enter password", text: $password)
                
            }
            .padding()
            Button(action: SignUp) {
                Text("Sign Up")
         
            }
                
            }
        }
        .padding()
    }
    
    func SignUp()
    {
        if !email.isEmpty && !password.isEmpty{
            session.signUp(email: email, password: password) { (result, error) in
                
                if error != nil{
                    
                   print(error)
                    
                    
                }
                else{
                    self.email = ""
                    self.password = ""
                    
                }
                
                
            }
            
        }
        
        
    }
    
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
