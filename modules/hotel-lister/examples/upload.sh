#!/usr/bin/env bash
# staging
# s3cmd --acl-public -r put ../../../../docs-site/public/ s3://docs.couchbase.com/samples-js-staging/
# production
# s3cmd --acl-public -r put ../../../../docs-site/public/tutorials/ s3://docs.couchbase.com/tutorials/