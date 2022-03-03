//
//  RealtimeDatabaseController.swift
//  Firebase_PR
//
//  Created by 이건준 on 2022/03/03.
//

import UIKit
import FirebaseDatabase
//import Firebase

class RealtimeDatabaseController: UIViewController {
    
    var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("add Realtime", for: .normal)
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return btn
    }()
    
    var button1: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("add Realtime1", for: .normal)
        btn.addTarget(self, action: #selector(tappedButton1), for: .touchUpInside)
        return btn
    }()
    
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        view.addSubview(button1)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button1.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = view.center
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        ref = Database.database().reference() //데이터베이스에서 데이터를 읽거나 쓰려면 FIRDatabaseReference 인스턴스가 필요
        
//        self.ref.child("users").child("20").observe(DataEventType.value, with: { snapshot in
//            print("snapshot = \(snapshot.value)")
//        })
        
//        self.ref.getData { error, snapshot in
//            if let _ = error {
//                print("error = \(error?.localizedDescription)")
//            }
//            if let value = snapshot.value {
//                print("value = \(value)")
//            }
//        }
        
        print("ref = \(ref)")
        print("autoid = \(self.ref.childByAutoId())")
        
        self.ref.observeSingleEvent(of: .value) { snapshot in
            print("snapshot = \(snapshot.value)")
            for a in snapshot.children {
                print("a = \(a)")
            }
            
        }
        
        
    }
    
    @objc func tappedButton() {
        self.ref.child("users").child("20").setValue(["username": "건wn"]) //해당 child에 맞게 마치 이어지듯이 value값까지 연결
        //위 방법은 지정된 위치에서 하위 노드를 포함하여 모든 데이터를 덮어씌움
        
//        self.ref.child("users/\("20")/username").setValue("이준")
        //위 방법은 전체 객체를 다시 쓰지 않고도 하위 항목을 업데이트하는 방법
        //사실 2방법 모두 뭐가 다른지 모르겠음 ㅇㅅ ㅇ
    }
    
    @objc func tappedButton1() {
        self.ref.child("rjswns/love/ang/kimmo").setValue("뭘fsf")
    }
}
