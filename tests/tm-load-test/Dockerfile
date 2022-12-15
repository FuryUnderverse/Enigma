FROM enigma/dev-base:latest

# ------------------ enigma chain ------------------

ARG ENIGMA_DIR=/go/src/github.com/furyunderverse/enigma/
# clone the repo
COPY . $ENIGMA_DIR

# build enigmad artifact
WORKDIR $ENIGMA_DIR
RUN make install

#----------------------building binary of tm-load-test custom client-------------------

WORKDIR $ENIGMA_DIR
RUN make build-load-test
WORKDIR $ENIGMA_DIR/build
RUN cp enigma-load-test /usr/bin/enigma-load-test
RUN enigma-load-test --help

WORKDIR /root/home

RUN bash $ENIGMA_DIR/tests/tm-load-test/init-master.sh
WORKDIR $ENIGMA_DIR/tests/tm-load-test
 
