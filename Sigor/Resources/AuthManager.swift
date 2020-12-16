//
//  AuthManager.swift
//  Sigor
//
//  Created by 이다영 on 2020/12/15.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - Check if username is available
         - Check if email is available
         - Create account
         - Insert account to database
         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) {
            canCreate in
            if canCreate {
                /*
                 - Create account
                 - Insert account to Database
                 */
                Auth.auth().createUser(withEmail: email, password: password) {
                    result, error in
                    guard error == nil, result != nil else {
                        // Firebase auth could not create account
                        completion(false)
                        return
                    }
                    // Insert into Database
                    DatabaseManager.shared.insertNewUser(with: email,
                                                         username: username) {
                        inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // Failed to insert to Database
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                // either username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password) {
                authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            // username log in
            print(username)
        }
    }
}
