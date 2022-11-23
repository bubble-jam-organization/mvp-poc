//
//  Presenter.swift
//  bubble-jam
//
//  Created by Thiago Henrique on 23/11/22.
//

import Foundation

protocol PresenterProtocol {
    func playAudio()
}

class Presenter: PresenterProtocol {
    weak var viewDelegate: ViewDelegate?
    
    func playAudio() {
        viewDelegate?.showLoading()
        print("Prepare audio...")
        let audio = Audio(speed: 1, data: Data())
        viewDelegate?.hideLoading()
        viewDelegate?.playAudioInView(audio: audio)
    }
}
