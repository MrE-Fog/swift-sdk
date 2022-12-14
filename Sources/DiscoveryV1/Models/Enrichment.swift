/**
 * (C) Copyright IBM Corp. 2018, 2022.
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
 Enrichment step to perform on the document. Each enrichment is performed on the specified field in the order that they
 are listed in the configuration.
 */
public struct Enrichment: Codable, Equatable {

    /**
     Describes what the enrichment step does.
     */
    public var description: String?

    /**
     Field where enrichments will be stored. This field must already exist or be at most 1 level deeper than an existing
     field. For example, if `text` is a top-level field with no sub-fields, `text.foo` is a valid destination but
     `text.foo.bar` is not.
     */
    public var destinationField: String

    /**
     Field to be enriched.
     Arrays can be specified as the **source_field** if the **enrichment** service for this enrichment is set to
     `natural_language_undstanding`.
     */
    public var sourceField: String

    /**
     Indicates that the enrichments will overwrite the destination_field field if it already exists.
     */
    public var overwrite: Bool?

    /**
     Name of the enrichment service to call. The only supported option is `natural_language_understanding`. The
     `elements` option is deprecated and support ended on 10 July 2020.
      The **options** object must contain Natural Language Understanding options.
     */
    public var enrichment: String

    /**
     If true, then most errors generated during the enrichment process will be treated as warnings and will not cause
     the document to fail processing.
     */
    public var ignoreDownstreamErrors: Bool?

    /**
     Options that are specific to a particular enrichment.
     The `elements` enrichment type is deprecated. Use the [Create a
     project](https://cloud.ibm.com/apidocs/discovery-data#createproject) method of the Discovery v2 API to create a
     `content_intelligence` project type instead.
     */
    public var options: EnrichmentOptions?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case description = "description"
        case destinationField = "destination_field"
        case sourceField = "source_field"
        case overwrite = "overwrite"
        case enrichment = "enrichment"
        case ignoreDownstreamErrors = "ignore_downstream_errors"
        case options = "options"
    }

    /**
      Initialize a `Enrichment` with member variables.

      - parameter destinationField: Field where enrichments will be stored. This field must already exist or be at
        most 1 level deeper than an existing field. For example, if `text` is a top-level field with no sub-fields,
        `text.foo` is a valid destination but `text.foo.bar` is not.
      - parameter sourceField: Field to be enriched.
        Arrays can be specified as the **source_field** if the **enrichment** service for this enrichment is set to
        `natural_language_undstanding`.
      - parameter enrichment: Name of the enrichment service to call. The only supported option is
        `natural_language_understanding`. The `elements` option is deprecated and support ended on 10 July 2020.
         The **options** object must contain Natural Language Understanding options.
      - parameter description: Describes what the enrichment step does.
      - parameter overwrite: Indicates that the enrichments will overwrite the destination_field field if it already
        exists.
      - parameter ignoreDownstreamErrors: If true, then most errors generated during the enrichment process will be
        treated as warnings and will not cause the document to fail processing.
      - parameter options: Options that are specific to a particular enrichment.
        The `elements` enrichment type is deprecated. Use the [Create a
        project](https://cloud.ibm.com/apidocs/discovery-data#createproject) method of the Discovery v2 API to create a
        `content_intelligence` project type instead.

      - returns: An initialized `Enrichment`.
     */
    public init(
        destinationField: String,
        sourceField: String,
        enrichment: String,
        description: String? = nil,
        overwrite: Bool? = nil,
        ignoreDownstreamErrors: Bool? = nil,
        options: EnrichmentOptions? = nil
    )
    {
        self.destinationField = destinationField
        self.sourceField = sourceField
        self.enrichment = enrichment
        self.description = description
        self.overwrite = overwrite
        self.ignoreDownstreamErrors = ignoreDownstreamErrors
        self.options = options
    }

}
