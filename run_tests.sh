#!/usr/bin/env bash
# Usage: ./run_tests.sh <PROBLEM_ID> <source.c>     e.g. ./run_tests.sh M06 m06.c
set -u
id="$1"; src="$2"; dir="$(dirname "$0")/testcases/$id"
[ -d "$dir" ] || { echo "No testcases for $id"; exit 1; }
bin="$(mktemp)"
gcc -std=c11 -Wall -O2 -o "$bin" "$src" -lm || { echo "Compile error"; exit 1; }
pass=0; total=0
for in in "$dir"/*.in; do
  n="$(basename "$in" .in)"; total=$((total+1))
  got="$("$bin" < "$in" 2>/dev/null | sed -e 's/[[:space:]]*$//')"
  want="$(sed -e 's/[[:space:]]*$//' "$dir/$n.out")"
  if [ "$got" == "$want" ]; then echo "case $n: PASS"; pass=$((pass+1));
  else echo "case $n: FAIL"; echo "  expected:"; echo "$want" | sed 's/^/    /'; echo "  got:"; echo "$got" | sed 's/^/    /'; fi
done
rm -f "$bin"
echo "$pass/$total passed"
