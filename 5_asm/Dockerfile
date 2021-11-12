# FROM nasm AS build
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

FROM scratch
# COPY --from=build /src/hello /
COPY hello-golf hello
CMD ["/hello"]
