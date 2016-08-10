import Foundation

class ArrayResponseMapper<A: ParsedItem> {
    
    static func process(obj: AnyObject?, mapper: (AnyObject? throws -> A?)) throws -> [A] {
        guard let json = obj as? [[String: AnyObject]] else { throw ResponseMapperError.Invalid }
        
        var items = [A]()
        for jsonNode in json {
            if let item = try mapper(jsonNode){
                items.append(item)
            }
        }
        return items
    }
}