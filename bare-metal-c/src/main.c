#include <stdbool.h>
#include <stdint.h>

static volatile int32_t* const kGpioDirectionSet    = (int32_t*)0x50000518;
static volatile int32_t* const kGpioSet             = (int32_t*)0x50000508;
static volatile int32_t* const kGpioClear           = (int32_t*)0x5000050C;
/// THIS CODE IS AN EXAMPLE FOR BARE METAL ON MICRO:BIT V2

const int32_t kPin21 = 0b00000000001000000000000000000000;
const int32_t kPin28 = 0b00010000000000000000000000000000;

extern void __nop();

static void ShortHang() {
  for (uint32_t i = 2000000; i > 0; i--) {
  }
}

[[noreturn]] void main() {
  *kGpioDirectionSet = kPin21 | kPin28;

  *kGpioClear = kPin28;
  while(true) {
    *kGpioSet = kPin21;
    ShortHang();
    *kGpioClear = kPin21;
    ShortHang();
  }
}

