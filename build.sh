#!/bin/sh

# Builds optimized for the local CPU (SSE4/AVX/AVX2/FMA/... as available).
# The resulting binary only runs on CPUs with the same instruction set.
# Override with e.g. OPTOPT="-march=x86-64-v3" ./build.sh
# After changing OPTOPT, run "make clean" first: make does not track flag changes.
gmake -j$(nproc) HAVE_GTK2=0 OPTOPT="${OPTOPT:--march=native}" "$@"
