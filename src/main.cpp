#include "Game.hpp"

int main(void)
{
  std::shared_ptr<App> game{std::make_shared<Game>()};
  game->run();

  return EXIT_SUCCESS;
}
