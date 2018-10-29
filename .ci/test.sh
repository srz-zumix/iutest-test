#!/bin/sh
if git rev-parse --ls-include-work-tree > /dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
fi

g++ --version
git submodule init
git submodule update
# echo | gcc -E -Wp,-v -
cd iutest/test
#make -j 4 ${MAKE_OPTION} && make test
make -j 4 USE_GTEST=1 && make test
make clean
make -j 4 USE_GMOCK=1 && make test
