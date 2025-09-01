#!/bin/bash



srun -n 64 matdyn.x < matdyn_bands.in &> matdyn_bands.in.out 
