/// THIS CODE IS AN EXAMPLE FOR BARE METAL ON MICRO:BIT V2

#include <cstdbool>
#include <cstdint>

template<typename T>
struct MemoryLocation {
  explicit MemoryLocation(const std::intptr_t address) : location(reinterpret_cast<volatile T* const>(address)) {}
  volatile T* const location = nullptr;

  void Write(const T& value) { *location = value; }
};

static MemoryLocation<std::int32_t> gpio_direction_setter = MemoryLocation<std::int32_t>(0x50000518);
static MemoryLocation<std::int32_t> gpio_setter = MemoryLocation<std::int32_t>(0x50000508);
static MemoryLocation<std::int32_t> gpio_clearer = MemoryLocation<std::int32_t>(0x5000050C);

// Micro:bit v2 - LED row 1
constexpr std::int32_t kPin21 = 0b00000000001000000000000000000000;
// Micro:bit v2 - LED col 1
constexpr std::int32_t kPin28 = 0b00010000000000000000000000000000;

static void ShortHang() {
  for (std::uint32_t i = 2000000; i > 0; i--) {
  }
}

extern "C" [[noreturn]] void main() {
  gpio_direction_setter.Write(kPin21 | kPin28);

  gpio_clearer.Write(kPin28);
  while(true) {
    gpio_setter.Write(kPin21);
    ShortHang();
    gpio_clearer.Write(kPin21);
    ShortHang();
  }
}

