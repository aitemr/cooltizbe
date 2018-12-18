import Alamofire
import CodableAlamofire

struct SearchService {
    
    func search(with query: String, completion: @escaping([Search]?) -> Void) {
        guard let url = URL(string: "http://schedule.iitu.kz/rest/user/search.php?query=\(query)&count=4") else {
            completion(nil)
            return
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        Alamofire.request(url).responseDecodableObject(keyPath: "result", decoder: decoder) {
            (response: DataResponse<[Search]>) in
            
            if !response.result.isSuccess {
                completion(nil)
                return
            }
            
            completion(response.result.value)
        }
    }
}
