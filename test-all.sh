make clean-all
for srfi in $(shell cat tmp/srfis.txt); do
    echo "Testing SRFI: $${srfi}"; \
    docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .; \
    docker run -v ${PWD}:/workdir --workdir /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make clean && sleep 5 && make SCHEME=${SCHEME} SRFI=$${srfi} test-compile-r7rs"; \
done
