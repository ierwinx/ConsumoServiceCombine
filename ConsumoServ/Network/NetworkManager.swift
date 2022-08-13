import Foundation

class NetworkManager {
    
    private let strUrl: String = "https://jsonplaceholder.typicode.com/posts"
    
    func getPosts(handler: @escaping(_ arrObj: [PostModel], NSError) -> ()) {
        
        guard let endpoint: URL = URL(string: strUrl) else {
            return
        }
        
        var request = URLRequest(url: endpoint)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let tarea = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.sync {
                if let errorNS = error as NSError? {
                    handler([], errorNS)
                }
                
                guard let dataRes = data, let objRes = try? JSONDecoder().decode([PostModel].self, from: dataRes) else {
                    handler([], NSError(domain: "NetworkManager.getPosts.errorParse", code: -1, userInfo: nil))
                    return
                }
                
                handler(objRes, NSError(domain: "exito", code: 0, userInfo: nil))
            }
        }
        
        tarea.resume()
        
    }
    
}
