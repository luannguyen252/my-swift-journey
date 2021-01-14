//
//  LoginModel.swift
//  AirbnbClone-SwiftUI
//
//  Created by Keerthi on 23/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import Foundation

struct LoginModel: Codable {

        let body: Body?
        let hTTPSTATUSCODE: Int?
        let message: String?
        let status: Bool?

        enum CodingKeys: String, CodingKey {
                case body = "body"
                case hTTPSTATUSCODE = "HTTP_STATUS_CODE"
                case message = "message"
                case status = "status"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                body = try values.decodeIfPresent(Body.self, forKey: .body)
                hTTPSTATUSCODE = try values.decodeIfPresent(Int.self, forKey: .hTTPSTATUSCODE)
                message = try values.decodeIfPresent(String.self, forKey: .message)
                status = try values.decodeIfPresent(Bool.self, forKey: .status)
        }

}

struct Body: Codable {

        let id: String?
        let index: Int?
        let email: String?
        let name: String?
        let isGmailLogin: Bool?
        let password: String?
        let roomId: String?
        let roomPassword: String?
        let status: Int?

        enum CodingKeys: String, CodingKey {
                case id = "_id"
                case index = "_index"
                case email = "email"
                case name = "name"
                case isGmailLogin = "is_gmail_login"
                case password = "password"
                case roomId = "room_id"
                case roomPassword = "room_password"
                case status = "status"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                index = try values.decodeIfPresent(Int.self, forKey: .index)
                email = try values.decodeIfPresent(String.self, forKey: .email)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                isGmailLogin = try values.decodeIfPresent(Bool.self, forKey: .isGmailLogin)
                password = try values.decodeIfPresent(String.self, forKey: .password)
                roomId = try values.decodeIfPresent(String.self, forKey: .roomId)
                roomPassword = try values.decodeIfPresent(String.self, forKey: .roomPassword)
                status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

}
