//
//  ViewController.swift
//  bubble-jam
//
//  Created by Thiago Henrique on 21/11/22.
//

import UIKit

protocol ViewDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func playAudioInView(audio: Audio)
}

class ViewController: UIViewController {
    var presenter: PresenterProtocol!
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Botão", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonTapped() {
        presenter.playAudio()
    }
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        configContraints()
    }
    
    func configContraints() {
        let buttonConstraints = [
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
    }

}

extension ViewController: ViewDelegate {
    func showLoading() {
        print("SHOWING LOADING...")
    }
    
    func hideLoading() {
        print("REMOVING LOADING...")
    }
    
    func playAudioInView(audio: Audio) {
        print("PLAYING AUDIO WITH SPEED \(audio.speed)!!!")
    }
}
