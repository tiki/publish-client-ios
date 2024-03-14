/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import Foundation

public struct LicenseRequest : Codable{
    var ptr: String
    var tags: [String]
    var uses: [Use]
    var terms: String
    var expiry: String?
    var titleDesc: String?
    var licenseDesc: String
}
