# Use a multi-stage build
FROM i386/debian as build

# Install packages necessary for installing NASM
RUN apt-get update \
  && apt-get install -y \
       asciidoc \
       build-essential \
       curl \
       xmlto

# Default version of NASM that we want to install
ARG NASMVERSION=2.14.02

# Download and install NASM
RUN curl --output nasm-${NASMVERSION}.tar.gz -L https://www.nasm.us/pub/nasm/releasebuilds/${NASMVERSION}/nasm-${NASMVERSION}.tar.gz \
  && tar -xzf nasm-${NASMVERSION}.tar.gz --directory /usr/local/src \
  && cd /usr/local/src/nasm-${NASMVERSION}/ \
  && ./configure \
  && make \
  && make install

CMD ["/bin/bash"]

# # Arguments for gcc:
# # - Compile for 32bit
# # - Link statically
# # - Optimize for size
# # - No standard system startup file (we have our own _start)
# # - No unwind tables (to make our executable even smaller)
# ARG GCCARGS="-m32 -static -Os -nostartfiles -fno-asynchronous-unwind-tables"

# WORKDIR /src
# COPY hello.asm /src

# # Compile and link our assembler code
# RUN nasm -f elf hello.asm \
#   && gcc ${GCCARGS} -o hello hello.o \
#   && strip -R .comment -s hello

# FROM scratch
# COPY --from=build /src/hello /
# CMD ["/hello"]
