//
//  GetProjectsOperation.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public class ProjectsRetrivalOperation: ServiceOperation{
    
    private let request: ProjectsRetrivalRequest
    
    public var success: ([ProjectItem] -> Void)?
    public var failure: (NSError -> Void)?
    
    public override init(){
        request = ProjectsRetrivalRequest()
        super.init()
    }
    
    public override func start() {
        super.start()
        service.request(request, success: handleSuccess, failure: handleFailure)
    }
    
    private func handleSuccess(response: AnyObject?) {
        do{
            guard let response = response as? NSDictionary else {
                handleFailure(NSError.cannotParseResponse())
                return
            }
            let projects = try ProjectsRetrivalResponseMapper.process(response["data"])
            self.success?(projects)
            self.finish()
        }catch{
            print(error)
            handleFailure(NSError.cannotParseResponse())
        }
    }
    
    private func handleFailure(error: NSError) {
        self.failure?(error)
        self.finish()
    }
}