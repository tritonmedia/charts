#!/usr/bin/env bash
#
# Verify that manifests are valid kubernetes manifests

pushd "tritonmedia" >/dev/null 2>&1 || exit 1
helm template --name triton . | kubeval --strict
popd >/dev/null 2>&1 || exit 1