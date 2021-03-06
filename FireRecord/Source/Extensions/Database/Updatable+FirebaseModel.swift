//
//  Updatable+Extension.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 16/08/17.
//

import Foundation

public extension Updatable where Self: FirebaseModel {
    func update(completion: @escaping (_ error: Error?) -> Void) {
        guard let key = self.key else {return}
        guard let json = toJSONObject() else {return}
        Self.classPath.child(key).updateChildValues(json) { (error, reference) in
            completion(error)
        }
    }
}
