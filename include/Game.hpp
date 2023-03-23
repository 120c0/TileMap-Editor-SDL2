#pragma once

#include "App.hpp"

#include <memory>
#include <iostream>

#include <SDL2/SDL.h>

class Game final : public App
{
public:
  explicit Game() noexcept;

  void run() noexcept override;

  ~Game() noexcept override;
private:
};
