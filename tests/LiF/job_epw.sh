#!/bin/bash



srun -n 8 epw.x -nk 8  < epw.in  &> epw.in.out 
cp ./wfn.xml ./save/wfn.xml
cp ./tmp/*epb* ./save/
