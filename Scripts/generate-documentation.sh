#!/bin/bash

# Set the output directory
outdir=${1:-gh-pages}

################################################################################
# Define list of services
################################################################################

services=(
  AssistantV1
  AssistantV2
  DiscoveryV1
  DiscoveryV2
  LanguageTranslatorV3
  NaturalLanguageUnderstandingV1
  SpeechToTextV1
  TextToSpeechV1
)

################################################################################
# Change directory to repository root
################################################################################

pushd `dirname $0` > /dev/null
root=`pwd`
popd > /dev/null
cd $root
cd ..

################################################################################
# Create folder for generated documentation
################################################################################

mkdir -p ${outdir}/services

################################################################################
# Run Jazzy to generate documentation
################################################################################

for service in ${services[@]}; do
  mkdir ${outdir}/services/${service}
  jazzy --config "Scripts/jazzy-config/${service}.jazzy.yaml"
done

################################################################################
# Generate index.html and copy supporting files
################################################################################

(
  version=$(git describe --tags)
  cat Scripts/generate-documentation-resources/index-prefix | sed "s/SDK_VERSION/$version/"
  for service in ${services[@]}; do
    echo "<li><a target="_blank" href="./services/${service}/index.html">${service}</a></li>"
  done
  echo -e "          </section>\n        </section>"
  sed -n '/<section id="footer">/,/<\/section>/p' ${outdir}/services/${services[0]}/index.html
  cat Scripts/generate-documentation-resources/index-postfix
) > ${outdir}/index.html

cp -r Scripts/generate-documentation-resources/* ${outdir}
rm ${outdir}/index-prefix ${outdir}/index-postfix

################################################################################
# Collect undocumented.json files
################################################################################

declare -a undocumenteds
undocumenteds=($(ls -r ${outdir}/services/*/undocumented.json))

(
  echo "["
  if [ ${#undocumenteds[@]} -gt 0 ]; then
    echo -e -n "\t"
    cat "${undocumenteds[0]}"
    unset undocumenteds[0]
    for f in "${undocumenteds[@]}"; do
      echo ","
      echo -e -n "\t"
      cat "$f"
    done
  fi
  echo -e "\n]"
) > ${outdir}/undocumented.json
