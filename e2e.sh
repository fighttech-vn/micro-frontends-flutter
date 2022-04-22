#!/bin/bash
set -e

sh clear.sh

flutter test integration_test/app_test.dart
