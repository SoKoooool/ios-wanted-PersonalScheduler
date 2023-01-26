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
    private lazy var dbCollection = db.collection("personalSchedule")
    
    func getDocuments(completion: @escaping ([ViewSchedule]) -> Void) {
        dbCollection.getDocuments { snapshot, error in
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
    
    func addDocument(data: [String : Any]) {
        ref = dbCollection.addDocument(data: data) {
            error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
        }
    }
    
    func setDocument(data: [String : Any], uid: String) {
        dbCollection.document(uid)
            .setData(data) { error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
            }
    }
    
    func deleteDocument(key: String, uid: String) {
        dbCollection.document(uid)
            .updateData([key : FieldValue.delete()]) { error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
            }
        
    }
}



