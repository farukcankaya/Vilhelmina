import Foundation

public final class BackendConfiguration {
    
    let baseURL: String
    let basePath: String
    let apiVersion: String
    
    let fullAPIURL: NSURL

    
    public init(baseURL: String, basePath:String, apiVersion:String) {
        self.baseURL = baseURL
        self.basePath = basePath
        self.apiVersion = apiVersion
        
        self.fullAPIURL = NSURL(string: NSString(format: "%@/%@/%@", baseURL, basePath, apiVersion) as String)!
    }
    
    public static var shared: BackendConfiguration!
}
