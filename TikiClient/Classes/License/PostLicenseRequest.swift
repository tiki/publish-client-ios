/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import Foundation

public struct PostLicenseRequest : Codable {
   let ptr: String
   let tags: [String]
   let uses: [Use]
   let terms: String
   let expiry: String?
   let titleDesc: String?
   let licenseDesc: String
   let userSignature: String
    
    public init(ptr: String, tags: [String], uses: [Use], terms: String, expiry: String?, titleDesc: String?, licenseDesc: String, privateKey: SecKey){
        self.ptr = ptr
        self.tags = tags
        self.uses = uses
        self.terms = terms
        self.expiry = expiry
        self.titleDesc = titleDesc
        self.licenseDesc = licenseDesc
        let licenseRequest = LicenseRequest(ptr: ptr, tags: tags, uses: uses, terms: terms, licenseDesc: licenseDesc)

        let jsonData = try! JSONEncoder().encode(licenseRequest)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        self.userSignature = (KeyService.sign(message: jsonString, privateKey: privateKey)?.base64EncodedString())!
    }
}


