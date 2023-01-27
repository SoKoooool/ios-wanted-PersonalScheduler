//
//  FirestoreService.swift
//  PersonalScheduler
//
//  Created by TORI on 2023/01/16.
//

import Foundation
import FirebaseFirestore

final class FirestoreService {
    
    private let db = Firestore.firestore()
    private var ref: DocumentReference?
    private var uid = ""
    
    func getDocuments(uid: String, completion: @escaping ([ViewSchedule]) -> Void) {
        self.uid = uid
        db.collection(uid)
            .getDocuments { snapshot, error in
                guard error == nil else {
                    print(error?.localizedDescription ?? #function)
                    return
                }
                guard let snapshot = snapshot else { return }
                let schedules = snapshot.documents.map {
                    ViewSchedule($0.data())
                }
                completion(schedules)
            }
    }
    
    func addDocument(data: [String : Any]) {
        ref = db.collection(uid)
            .addDocument(data: data) { error in
            guard error == nil else {
                print(error?.localizedDescription ?? #function)
                return
            }
        }
        guard let id = ref?.documentID else { return }
        updateDocument(id: id, data: ["id" : id])
    }
    
    func updateDocument(id: String, data: [String : Any]) {
        db.collection(uid)
            .document(id)
            .updateData(data) { error in
                guard error == nil else {
                    print(error?.localizedDescription ?? #function)
                    return
                }
            }
    }
    
    func deleteDocument(id: String) {
        db.collection(uid).document(id).delete()
    }
}



