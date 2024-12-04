//
//  RegistrationManager.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 23.07.2024.
//

import Foundation
import Firebase


class RegistrationManager {
    // create User
    // add Data
    
    func createUser(userInfo: UserInfo, completion: @escaping (Result<Bool, Error>) -> ()) {
        Auth.auth().createUser(withEmail: userInfo.email, password: userInfo.password) { [ weak self] result, error in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard let self = self else { return }
            guard let result else { return }
            
            result.user.sendEmailVerification()
            
            setUserInfo(uid: result.user.uid, userInfo: userInfo) { _ in
                completion(.success(true))
            }
        }
    }
    
    private func setUserInfo(uid: String, userInfo: UserInfo, completion: @escaping (Bool) -> ()) {
        let userData: [String: Any] = [
            // userInfo.name -> as Any
            "name": userInfo.name ?? "",
            "email": userInfo.email,
            "regDate": Date()
        ]
        
        Firestore.firestore()
            .collection(.users)
            .document(uid)
            .setData(userData) { _ in
                completion(true)
            }
    }
}
