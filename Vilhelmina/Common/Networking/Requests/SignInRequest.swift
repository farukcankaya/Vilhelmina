import Foundation

final class SignInRequest: BackendAPIRequest {
    
    private let email: String
    private let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    var endpoint: String {
        return "/tokens"
    }
    
    var method: NetworkService.Method {
        return .POST
    }
    
    var parameters: [String : AnyObject]? {
        return [
            "agent":[
                "email": email,
                "password": password
            ]
        ]
    }
    
    var headers: [String : String]? {
        return defaultJSONHeaders()
    }
}