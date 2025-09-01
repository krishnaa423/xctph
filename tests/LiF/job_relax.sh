#!/bin/bash



srun -n 128 pw.x  < relax.in &> relax.in.out

cp ./tmp/struct.save/data-file-schema.xml ./relax.xml

# Copy the end atomic positions and cell parameters (if vc-relax).
awk '/Begin final coordinates/ {end_flag=1; next} end_flag && /CELL_PARAMETERS/ {cell_flag=1; next} /End final coordinates/ {end_flag=0} end_flag && cell_flag {print; if (length==0) cell_flag=0 }' relax.in.out > relaxed_cell_parameters.txt
awk '/Begin final coordinates/ {end_flag=1; next} end_flag && /ATOMIC_POSITIONS/ {pos_flag=1; next} /End final coordinates/ {end_flag=0}  end_flag && pos_flag { print $1, $2, $3, $4 }' relax.in.out > relaxed_atomic_positions.txt

# Update from relax.
fpflow --generator=create
