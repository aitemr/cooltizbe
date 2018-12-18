import UIKit

struct Search: Codable {
    let id: String
    let type: String
    let nameEn: String
    
    private enum CodingKeys: String, CodingKey {
        case id, type
        case nameEn = "name_en"
    }
}
