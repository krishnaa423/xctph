#!/bin/bash



rm -rf xctph.out
touch xctph.out
exec &> xctph.out

srun -n 128 python3 script_xctph.py &> script_xctph.py.out
