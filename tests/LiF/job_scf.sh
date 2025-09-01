#!/bin/bash



srun -n 128 pw.x  < scf.in &> scf.in.out

cp ./tmp/struct.save/data-file-schema.xml ./scf.xml
