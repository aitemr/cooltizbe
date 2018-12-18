import UIKit

struct Search: Decodable {
    let id: String
    let type: String
    let nameEn: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case nameEn = "name_en"
    }
}
