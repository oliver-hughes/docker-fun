#include <unistd.h>

void _start(void) {
  write(1, "Hello world!", 12);
  _exit(0);
}
