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

/**
 (Experimental) Returns a summary of content.
 Supported languages: English only.
 */
public struct SummarizationOptions: Codable, Equatable {

    /**
     Maximum number of summary sentences to return.
     */
    public var limit: Int?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case limit = "limit"
    }

    /**
      Initialize a `SummarizationOptions` with member variables.

      - parameter limit: Maximum number of summary sentences to return.

      - returns: An initialized `SummarizationOptions`.
     */
    public init(
        limit: Int? = nil
    )
    {
        self.limit = limit
    }

}
