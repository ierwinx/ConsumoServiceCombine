import Combine
import Foundation

class PostsViewModel: ObservableObject {
    
    //MARK: - Variables
    private let didChange = PassthroughSubject<PostsViewModel, Never>()
    @Published var arrPost = [PostModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    //MARK: - Initializers
    init() {
        getListPost()
    }
    
    //MARK: - Private Methods
    private func getListPost() {
        let network = NetworkManager()
        network.getPosts { arrObj, error in
            if error.code == 0 {
                self.arrPost = arrObj
            } else {
                debugPrint(error)
            }
        }
    }
    
}
