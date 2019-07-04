#!/bin/bash
set -euo pipefail

buildkite-agent meta-data set "STEP" "pipelineupload" 2> /dev/null || export STEPLOCAL="pipelineupload"

PIPELINE_YML=.buildkite/pipeline.yml

sed <"${PIPELINE_YML}" \
    -e "s/INSTANCE_ID/${BUILDKITE_AGENT_META_DATA_AWS_INSTANCE_ID}/g" \
    -e "s/QUEUE/${QUEUE}/g"