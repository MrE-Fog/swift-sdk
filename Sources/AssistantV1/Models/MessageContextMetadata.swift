/**
 * (C) Copyright IBM Corp. 2018, 2021.
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

/**
 Metadata related to the message.
 */
public struct MessageContextMetadata: Codable, Equatable {

    /**
     A label identifying the deployment environment, used for filtering log data. This string cannot contain carriage
     return, newline, or tab characters.
     */
    public var deployment: String?

    /**
     A string value that identifies the user who is interacting with the workspace. The client must provide a unique
     identifier for each individual end user who accesses the application. For user-based plans, this user ID is used to
     identify unique users for billing purposes. This string cannot contain carriage return, newline, or tab characters.
     If no value is specified in the input, **user_id** is automatically set to the value of
     **context.conversation_id**.
     **Note:** This property is the same as the **user_id** property at the root of the message body. If **user_id** is
     specified in both locations in a message request, the value specified at the root is used.
     */
    public var userID: String?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case deployment = "deployment"
        case userID = "user_id"
    }

    /**
      Initialize a `MessageContextMetadata` with member variables.

      - parameter deployment: A label identifying the deployment environment, used for filtering log data. This string
        cannot contain carriage return, newline, or tab characters.
      - parameter userID: A string value that identifies the user who is interacting with the workspace. The client
        must provide a unique identifier for each individual end user who accesses the application. For user-based plans,
        this user ID is used to identify unique users for billing purposes. This string cannot contain carriage return,
        newline, or tab characters. If no value is specified in the input, **user_id** is automatically set to the value
        of **context.conversation_id**.
        **Note:** This property is the same as the **user_id** property at the root of the message body. If **user_id**
        is specified in both locations in a message request, the value specified at the root is used.

      - returns: An initialized `MessageContextMetadata`.
     */
    public init(
        deployment: String? = nil,
        userID: String? = nil
    )
    {
        self.deployment = deployment
        self.userID = userID
    }

}
