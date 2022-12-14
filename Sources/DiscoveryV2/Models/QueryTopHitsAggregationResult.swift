/**
 * (C) Copyright IBM Corp. 2019, 2020.
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
 A query response that contains the matching documents for the preceding aggregations.
 */
public struct QueryTopHitsAggregationResult: Codable, Equatable {

    /**
     Number of matching results.
     */
    public var matchingResults: Int

    /**
     An array of the document results.
     */
    public var hits: [[String: JSON]]?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case matchingResults = "matching_results"
        case hits = "hits"
    }

}
