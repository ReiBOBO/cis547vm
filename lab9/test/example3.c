#include <stdio.h>

#include "../include/Runtime.h"

int main()
{
  int x;
  DSE_Input(x); // x
  int y;
  DSE_Input(y); // y
  int z;
  DSE_Input(z); // z
  int w = 2;

  if (x > 100)
  {
    y *= 2;
  }

  if (y == z * 5)
  {
    y = y / (z - 10);
  }

  if (x + y < 1000)
  {
    z = z / (y-500);
  }

  return 0;
}