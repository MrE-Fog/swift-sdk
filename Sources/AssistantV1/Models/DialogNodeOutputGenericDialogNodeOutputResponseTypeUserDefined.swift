/**
 * (C) Copyright IBM Corp. 2021.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import IBMSwiftSDKCore

/**
 DialogNodeOutputGenericDialogNodeOutputResponseTypeUserDefined.

 Enums with an associated value of DialogNodeOutputGenericDialogNodeOutputResponseTypeUserDefined:
    DialogNodeOutputGeneric
 */
public struct DialogNodeOutputGenericDialogNodeOutputResponseTypeUserDefined: Codable, Equatable {

    /**
     The type of response returned by the dialog node. The specified response type must be supported by the client
     application or channel.
     */
    public var responseType: String

    /**
     An object containing any properties for the user-defined response type. The total size of this object cannot exceed
     5000 bytes.
     */
    public var userDefined: [String: JSON]

    /**
     An array of objects specifying channels for which the response is intended.
     */
    public var channels: [ResponseGenericChannel]?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case responseType = "response_type"
        case userDefined = "user_defined"
        case channels = "channels"
    }

    /**
      Initialize a `DialogNodeOutputGenericDialogNodeOutputResponseTypeUserDefined` with member variables.

      - parameter responseType: The type of response returned by the dialog node. The specified response type must be
        supported by the client application or channel.
      - parameter userDefined: An object containing any properties for the user-defined response type. The total size
        of this object cannot exceed 5000 bytes.
      - parameter channels: An array of objects specifying channels for which the response is intended.

      - returns: An initialized `DialogNodeOutputGenericDialogNodeOutputResponseTypeUserDefined`.
     */
    public init(
        responseType: String,
        userDefined: [String: JSON],
        channels: [ResponseGenericChannel]? = nil
    )
    {
        self.responseType = responseType
        self.userDefined = userDefined
        self.channels = channels
    }

}
