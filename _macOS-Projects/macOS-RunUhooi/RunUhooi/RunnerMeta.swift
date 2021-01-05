//
//  RunnerMeta.swift
//  RunUhooi
//
//  Created by Takuto Nakamura on 2020/10/31.
//

import Foundation

struct RunnerMeta {

    private(set) var id: Int
    private(set) var imageTag: String
    private(set) var template: Bool


    init?(id: Int) {
        switch id {
        case 0: // color
            self.id = id
            self.imageTag = "uhooi-color-"
            self.template = false
        case 1: // monochrome
            self.id = id
            self.imageTag = "uhooi-mono-"
            self.template = true
        default:
            return nil
        }
    }

}
