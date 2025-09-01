#!/bin/bash



srun -n 64 dynmat.x < dynmat.in &> dynmat.in.out 
