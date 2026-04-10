#!/bin/bash

rm -rf report results.jtl

jmeter -n -t scripts/TestPlan.jmx -l results.jtl -e -o report