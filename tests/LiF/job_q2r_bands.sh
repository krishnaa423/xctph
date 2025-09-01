#!/bin/bash



srun -n 64 q2r.x < q2r_bands.in &> q2r_bands.in.out
