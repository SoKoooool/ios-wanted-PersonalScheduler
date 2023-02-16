//
//  ViewController.swift
//  PersonalScheduler
//
//  Created by kjs on 06/01/23.
//

import UIKit
import AuthenticationServices
import FacebookLogin
import FBSDKLoginKit

// MARK: - Life Cycle

final class LoginViewController: UIViewController {

    private let viewModel: LoginViewModel!
    
    private let signInButtonStackView: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.spacing = 8
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private let appleSignInButton: ASAuthorizationAppleIDButton = {
        let btn = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
        return btn
    }()
    
    private let facebookSignInButton: FBLoginButton = {
        let btn = FBLoginButton()
        btn.permissions = ["public_profile", "email"]
        return btn
    }()
    
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = LoginViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        bind()
        makeConstraints()
    }
}

// MARK: - Actions

extension LoginViewController {
    
    @objc
    private func signInButtonTapped(_ sender: ASAuthorizationAppleIDButton) {
        viewModel.appleLoginIn()
    }
}

// MARK: - Attributes

extension LoginViewController {
    
    private func setupViews() {
        setupSignInButtonStackView()
        setupAppleSignInButton()
        setupFacebookSignInButton()
    }
    
    private func setupSignInButtonStackView() {
        view.addSubview(signInButtonStackView)
    }
    
    private func setupAppleSignInButton() {
        signInButtonStackView.addArrangedSubview(appleSignInButton)
        appleSignInButton.addTarget(self, action: #selector(signInButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func setupFacebookSignInButton() {
        signInButtonStackView.addArrangedSubview(facebookSignInButton)
    }
}

// MARK: - Bind

extension LoginViewController {
 
    private func bind() {
        
    }
}

// MARK: - Constraints

extension LoginViewController {
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            signInButtonStackView
                .centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            signInButtonStackView
                .centerYAnchor
                .constraint(equalTo: view.centerYAnchor)
        ])
    }
}
