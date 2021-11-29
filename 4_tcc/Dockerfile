# FROM ubuntu as build
# RUN apt-get update
# RUN apt-get install build-essential -y
# COPY /hello.c /hello.c
# RUN gcc hello.c -o hello --static

FROM scratch
# COPY --from=build hello hello
COPY hellotcc hellotcc
CMD ["./hellotcc"]
