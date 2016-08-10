import Foundation

final class SignInResponseMapper: ResponseMapper<SignInItem>, ResponseMapperProtocol {
    
    static func process(obj: AnyObject?) throws -> SignInItem {
        return try process(obj, parse: { json in
            guard let data = json["data"] as? NSDictionary else { return nil }
            guard let token = data["token"] as? String else { return nil }
            
            return SignInItem(token: token)
        })
    }
}
