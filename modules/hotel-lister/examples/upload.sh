#!/usr/bin/env bash
s3cmd --acl-public -r put ../../../../docs-site/public/ s3://docs.couchbase.com/samples-js-staging/