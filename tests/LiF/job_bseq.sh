#!/bin/bash


start=0
stop=8

size=8

folders=("./bseq/Q_0.0000000000_0.0000000000_0.0000000000" "./bseq/Q_0.0000000000_0.0000000000_0.5000000000" "./bseq/Q_0.0000000000_0.5000000000_0.0000000000" "./bseq/Q_0.0000000000_0.5000000000_0.5000000000" "./bseq/Q_0.5000000000_0.0000000000_0.0000000000" "./bseq/Q_0.5000000000_0.0000000000_0.5000000000" "./bseq/Q_0.5000000000_0.5000000000_0.0000000000" "./bseq/Q_0.5000000000_0.5000000000_0.5000000000" )


rm -rf ./bseq.out
touch ./bseq.out

LOG_FILE="$(pwd)/bseq.out"
exec &> "$LOG_FILE"





ln -sf ../bseq/Q_0.0000000000_0.0000000000_0.0000000000 ./bseq_for_xctph/Q_0
ln -sf ../bseq/Q_0.0000000000_0.0000000000_0.5000000000 ./bseq_for_xctph/Q_1
ln -sf ../bseq/Q_0.0000000000_0.5000000000_0.0000000000 ./bseq_for_xctph/Q_2
ln -sf ../bseq/Q_0.0000000000_0.5000000000_0.5000000000 ./bseq_for_xctph/Q_3
ln -sf ../bseq/Q_0.5000000000_0.0000000000_0.0000000000 ./bseq_for_xctph/Q_4
ln -sf ../bseq/Q_0.5000000000_0.0000000000_0.5000000000 ./bseq_for_xctph/Q_5
ln -sf ../bseq/Q_0.5000000000_0.5000000000_0.0000000000 ./bseq_for_xctph/Q_6
ln -sf ../bseq/Q_0.5000000000_0.5000000000_0.5000000000 ./bseq_for_xctph/Q_7


for (( i=$start; i<$stop; i++ )); do
    cd ${folders[$i]}

    echo -e "\n\n\n"

    echo "Running ${i} th kpoint"
    echo "Entering folder ${folders[$i]}"
    
    echo "Starting kernel for ${folders[$i]}"
    ln -sf ../../epsmat.h5 ./
    ln -sf ../../eps0mat.h5 ./
    ln -sf ../../WFN_parabands.h5 ./WFN_co.h5 
    ln -sf ../../WFN_parabands.h5 ./WFNq_co.h5 
    srun -n 128 kernel.cplx.x &> kernel.inp.out

    echo "Done kernel for ${folders[$i]}"

    echo "Starting absorption for ${folders[$i]}"
    ln -sf ../../epsmat.h5 ./
    ln -sf ../../eps0mat.h5 ./
    ln -sf ../../eqp1.dat eqp_co.dat 
    ln -sf ../../WFN_parabands.h5 ./WFN_co.h5 
    ln -sf ../../WFN_parabands.h5 ./WFNq_co.h5 
    ln -sf ../../WFN_parabands.h5 ./WFN_fi.h5 
    ln -sf ../../WFN_parabands.h5 ./WFNq_fi.h5 
    srun -n 1 absorption.cplx.x &> absorption.inp.out
    mv bandstructure.dat bandstructure_absorption.dat

    echo "Done absorption for ${folders[$i]}"

    echo "Starting plotxct for ${folders[$i]}"
    ln -sf ../../WFN_parabands.h5 ./WFN_fi.h5 
ln -sf ../../WFN_parabands.h5 ./WFNq_fi.h5 
    srun -n 128 plotxct.cplx.x &> plotxct.inp.out 
    volume.py ../../scf.in espresso *.a3Dr a3dr plotxct_elec.xsf xsf false abs2 true 
    rm -rf *.a3Dr

    echo "Done plotxct for ${folders[$i]}"
    cd ../../

    echo "Exiting folder ${folders[$i]}"
done
