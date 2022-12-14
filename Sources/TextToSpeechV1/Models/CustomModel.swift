/**
 * (C) Copyright IBM Corp. 2020, 2021.
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
 Information about an existing custom model.
 */
public struct CustomModel: Codable, Equatable {

    /**
     The customization ID (GUID) of the custom model. The [Create a custom model](#createcustommodel) method returns
     only this field. It does not not return the other fields of this object.
     */
    public var customizationID: String

    /**
     The name of the custom model.
     */
    public var name: String?

    /**
     The language identifier of the custom model (for example, `en-US`).
     */
    public var language: String?

    /**
     The GUID of the credentials for the instance of the service that owns the custom model.
     */
    public var owner: String?

    /**
     The date and time in Coordinated Universal Time (UTC) at which the custom model was created. The value is provided
     in full ISO 8601 format (`YYYY-MM-DDThh:mm:ss.sTZD`).
     */
    public var created: String?

    /**
     The date and time in Coordinated Universal Time (UTC) at which the custom model was last modified. The `created`
     and `updated` fields are equal when a model is first added but has yet to be updated. The value is provided in full
     ISO 8601 format (`YYYY-MM-DDThh:mm:ss.sTZD`).
     */
    public var lastModified: String?

    /**
     The description of the custom model.
     */
    public var description: String?

    /**
     An array of `Word` objects that lists the words and their translations from the custom model. The words are listed
     in alphabetical order, with uppercase letters listed before lowercase letters. The array is empty if no words are
     defined for the custom model. This field is returned only by the [Get a custom model](#getcustommodel) method.
     */
    public var words: [Word]?

    /**
     An array of `Prompt` objects that provides information about the prompts that are defined for the specified custom
     model. The array is empty if no prompts are defined for the custom model. This field is returned only by the [Get a
     custom model](#getcustommodel) method.
     */
    public var prompts: [Prompt]?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case customizationID = "customization_id"
        case name = "name"
        case language = "language"
        case owner = "owner"
        case created = "created"
        case lastModified = "last_modified"
        case description = "description"
        case words = "words"
        case prompts = "prompts"
    }

}
