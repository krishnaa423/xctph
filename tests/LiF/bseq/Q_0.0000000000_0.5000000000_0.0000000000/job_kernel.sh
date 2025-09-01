#!/bin/bash



ln -sf ../../epsmat.h5 ./
ln -sf ../../eps0mat.h5 ./
ln -sf ../../WFN_parabands.h5 ./WFN_co.h5 
ln -sf ../../WFN_parabands.h5 ./WFNq_co.h5 
srun -n 128 kernel.cplx.x &> kernel.inp.out
