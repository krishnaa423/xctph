#!/bin/bash



srun -n 128 pw2bgw.x -pd .true. < wfnq_pw2bgw.in &> wfnq_pw2bgw.in.out
cp ./tmp/WFNq_coo ./
cp ./tmp/struct.xml ./wfnq.xml
wfn2hdf.x BIN WFNq_coo WFNq_coo.h5  
