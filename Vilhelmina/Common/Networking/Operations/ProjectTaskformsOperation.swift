//
//  ProjectTaskformsOperation.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public class ProjectTaskformsOperation: ServiceOperation{
    
    private let request: ProjectTaskformsRequest
    
    public var success: ([ProjectTaskformItem] -> Void)?
    public var failure: (NSError -> Void)?
    
    public init(projectId:Int){
        request = ProjectTaskformsRequest(projectId: projectId)
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
            let projectTaskforms = try ProjectTaskformsResponseMapper.process(response["data"])
            self.success?(projectTaskforms)
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