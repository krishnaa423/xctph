#!/bin/bash



ln -sf ../../epsmat.h5 ./
ln -sf ../../eps0mat.h5 ./
ln -sf ../../eqp1.dat eqp_co.dat 
#ln -sf ../../bsemat.h5 ./
ln -sf ../../WFN_parabands.h5 ./WFN_co.h5 
ln -sf ../../WFN_parabands.h5 ./WFNq_co.h5 
ln -sf ../../WFN_parabands.h5 ./WFN_fi.h5 
ln -sf ../../WFN_parabands.h5 ./WFNq_fi.h5 
srun -n 1 absorption.cplx.x &> absorption.inp.out
mv bandstructure.dat bandstructure_absorption.dat
