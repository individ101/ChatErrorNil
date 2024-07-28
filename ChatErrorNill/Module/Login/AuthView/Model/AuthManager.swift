//
//  AuthManager.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 23.07.2024.
//

import Foundation
import Firebase

class AuthManager {
    func auth(userInfo: UserInfo, completion: @escaping (Result<Bool, Error>) -> ()) {
        Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { result, error in
            guard error == nil else {
                completion(.failure(error!))
                return }
            guard let result else { return }
            
            Firestore.firestore()
                .collection(.users)
                .document(result.user.uid)
                .getDocument { snap, error in
                    guard error == nil else { return }
                    if let userData = snap?.data() {
                        let name = userData["name"] as? String ?? ""
                        UserDefaults.standard.set(name, forKey: "selfName")
                    }
                }
        
                completion(.success(true))
            
        }
    }
}
