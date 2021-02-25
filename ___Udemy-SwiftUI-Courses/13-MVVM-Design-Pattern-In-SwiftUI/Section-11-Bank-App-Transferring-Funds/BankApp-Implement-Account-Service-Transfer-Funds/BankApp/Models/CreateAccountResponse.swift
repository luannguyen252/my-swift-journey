//
//  CreateAccountResponse.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/9/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

struct CreateAccountResponse: Decodable {
    let success: Bool
    let error: String?
}
