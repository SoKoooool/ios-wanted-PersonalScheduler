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
    
    func get(completion: @escaping ([ViewSchedule]) -> Void) {
        db.collection("personalSchedule")
            .getDocuments { snapshot, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let snapshot = snapshot else { return }
                let schedules = snapshot.documents.map {
                    ViewSchedule($0.data())
                }
                completion(schedules)
            }
    }
    
    func add(data: [String : Any]) {
        ref = db.collection("personalSchedule")
            .addDocument(data: data) {
            error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
        }
    }
    
    func set(data: [String : Any], uid: String) {
        db.collection("personalSchedule")
            .document(uid)
            .setData(data) { error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
            }
    }
    
    func delete(key: String, uid: String) {
        db.collection("personalSchedule")
            .document(uid)
            .updateData([key : FieldValue.delete()]) { error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
            }
        
    }
}



