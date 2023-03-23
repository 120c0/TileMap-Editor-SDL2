#pragma once

class App
{
public:
  virtual void run() noexcept = 0;
  virtual ~App() = default;
};
