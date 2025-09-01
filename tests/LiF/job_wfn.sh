#!/bin/bash



srun -n 128 pw.x  < wfn.in &> wfn.in.out 

cp ./tmp/struct.xml ./wfn.xml
