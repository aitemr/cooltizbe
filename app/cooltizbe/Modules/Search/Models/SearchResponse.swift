import UIKit

enum SearchType: String, Codable {
    case group
    case room
    case teacher
}

struct SearchResponse: Codable {
    let id: String
    let type: SearchType
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case id, type
        case name = "name_en"
    }
}
