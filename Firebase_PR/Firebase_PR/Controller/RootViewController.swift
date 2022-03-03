//
//  RootViewController.swift
//  Firebase_PR
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit
import Firebase

class RootViewController: UIViewController {
    
    var ref: DocumentReference? = nil
    var db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a new document with a generated ID
  
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }

    }
}
