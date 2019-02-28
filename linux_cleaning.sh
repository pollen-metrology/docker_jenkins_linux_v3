#!/bin/bash
find /home/jenkins/jenkins_linux_v3/workspace -type d -name 'conan.tmp*' -exec rm -rf {} \; 2> /dev/null
