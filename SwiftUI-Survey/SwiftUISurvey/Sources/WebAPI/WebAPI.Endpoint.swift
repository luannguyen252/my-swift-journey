//
//  WebAPI.Endpoint.swift
//  SwiftUISurvey
//
//  Created by Amir on 01/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//
import Foundation

extension WebAPI {
    public enum Endpoint {
        case surveys
        case survey(id: String)
        case questions
        case question(id: String)
        
        public func path() -> String {
            switch self {
            case .surveys:
                return "surveys"
            case .survey(let id):
                return "surveys/\(id)"
            case .questions:
                return "questions"
            case .question(let id):
                return "questions/\(id)"
            }
        }
        
        public func url() -> URL {
            Constants.baseURL.appendingPathComponent(path())
        }
    }

}
