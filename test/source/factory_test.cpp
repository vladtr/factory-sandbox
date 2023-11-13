#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "factory" ? 0 : 1;
}
