import Alamofire
import CodableAlamofire

struct ScheduleService {
    
    func loadSchedule(for id: String, completion: @escaping([Schedule]?) -> Void) {
        // http://schedule.iitu.kz/rest/user/get_timetable_room.php?bundle_id=291
        // http://schedule.iitu.kz/rest/user/get_timetable_block.php?block_id=22223
        // http://schedule.iitu.kz/rest/user/get_timetable_teacher.php?teacher_id=759
        
        guard let url = URL(string: "http://schedule.iitu.kz/rest/user/get_timetable_block.php?block_id=\(id)") else {
            completion(nil)
            return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        Alamofire.request(url).responseDecodableObject(keyPath: "result", decoder: decoder) {
            (response: DataResponse<[Schedule]>) in
            
            if !response.result.isSuccess {
                completion(nil)
                return
            }
            
            completion(response.result.value)
        }
    }
    
}
