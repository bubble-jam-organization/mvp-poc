import XCTest
@testable import POC_MVP

final class PresenterTests: XCTestCase {
    func test_whenPlay_shouldCall_delegateCorrectly() {
        let presenter = Presenter()
        let delegateSpy = SpyDelegate()
        presenter.viewDelegate = delegateSpy
        
        presenter.playAudio()
        
        XCTAssertEqual(delegateSpy.message, [.showLoading, .hideLoading, .playInView])
            
    }
    
    class SpyDelegate: ViewDelegate {
        private(set) var message: [Message] = [Message]()
        
        enum Message {
            case showLoading
            case hideLoading
            case playInView
        }
        
        func showLoading() {
            message.append(.showLoading)
        }
        
        func hideLoading() {
            message.append(.hideLoading)
        }
        
        func playAudioInView(audio: POC_MVP.Audio) {
            message.append(.playInView)
        }
        
        
    }
}
