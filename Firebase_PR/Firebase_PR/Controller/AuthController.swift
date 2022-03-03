//
//  AuthController.swift
//  Firebase_PR
//
//  Created by 이건준 on 2022/03/03.
//

import UIKit
import FirebaseAuth

class AuthController: UIViewController {
    var idTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "아이디 입력"
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    var pwTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "비밀번호 입력"
        tf.keyboardType = .alphabet
        return tf
    }()
    
    var signButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("회원가입", for: .normal)
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return btn
    }()
    
    var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("로그인", for: .normal)
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(signButton)
        view.addSubview(loginButton)
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        signButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        idTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        pwTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor).isActive = true
        
        signButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 10).isActive = true
        signButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        loginButton.centerYAnchor.constraint(equalTo: signButton.centerYAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         Auth.auth().addStateDidChangeListener { auth, user in
            if let user = auth.currentUser {
                print("He is currentUser")
                print("email = \(user.providerData[0].email)")
                print("email = \(user.providerData[0].phoneNumber)")
                print("email = \(user.providerData[0].photoURL)")
                print("email = \(user.providerData[0].providerID)")
                print("email = \(user.providerData[0].displayName)")
            }
        }
        
        if Auth.auth().currentUser != nil {
            
        }
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        let title = sender.titleLabel?.text
        if title == "회원가입" {
            Auth.auth().createUser(withEmail: idTextField.text!, password: pwTextField.text!) { result, error in
                
            }
        }else if title == "로그인" {
            Auth.auth().signIn(withEmail: idTextField.text!, password: pwTextField.text!, completion: nil)
        }
    }
}
