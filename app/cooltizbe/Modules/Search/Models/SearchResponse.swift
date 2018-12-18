import UIKit

enum Type: String, Codable {
    case group
    case room
    case teacher
}

struct SearchResponse: Codable {
    let id: String
    let type: Type
    let nameEn: String
    
    private enum CodingKeys: String, CodingKey {
        case id, type
        case nameEn = "name_en"
    }
}
