#!/bin/bash



srun -n 128 ph.x  < dfpt.in &> dfpt.in.out

python3 ./create_save.py
