//
//  Post.swift
//  BeReal-GiuliRussi
//
//  Created by Giuliana Russi on 3/4/24.
//

import Foundation
import ParseSwift


struct Post: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    var caption: String?
    var user: User?
    var imageFile: ParseFile?
}



