//
//  AppIconsService.swift
//  AppIcons
//
//  Created by Ross Butler on 19/12/2019.
//

import Foundation

protocol IconsService {
    func icons(primaryIconName: String, primaryIconFileName: String?) -> Icons?
    func isAvailable() -> Bool
    func setPreferredIcon(_ icon: Icon, completion: ((PreferredIconResult) -> Void)?)
}
