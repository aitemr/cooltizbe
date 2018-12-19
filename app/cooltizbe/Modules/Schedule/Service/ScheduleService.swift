import Alamofire
import CodableAlamofire

struct ScheduleService {
    
    func loadSchedule(with response: SearchResponse, completion: @escaping([Schedule]?) -> Void) {
        let path = getSearchQueryPath(for: response.type)
        
        guard let url = URL(string: "http://schedule.iitu.kz/rest/user/get_timetable_\(path)=\(response.id)") else {
            completion(nil)
            return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        Alamofire.request(url).responseDecodableObject(keyPath: "timetable", decoder: decoder) {
            (response: DataResponse<[Schedule]>) in
            
            if !response.result.isSuccess {
                completion(nil)
                return
            }
            
            completion(response.result.value)
        }
    }
    
    // MARK: - Get Search Path
    
    private func getSearchQueryPath(for type: SearchType) -> String {
        switch type {
        case .teacher:
            return "teacher.php?teacher_id"
        case .group:
            return "block.php?block_id"
        case .room:
            return "room.php?bundle_id"
        }
    }
}
