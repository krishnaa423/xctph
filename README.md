# Overview
Xctph is a python package for computing exciton-phonon matrix elements which are related to the 
exciton expansion coefficient $`A^{SQ}_{cvk}`$ and electron-phonon matrix elements $`g_{mn\nu}(k,q)`$
through the following contraction:

$`G_{S'S\nu}(Q,q)= \sum_{cc'vk} A^{SQ+q\star}_{cvk+q}g_{cc'\nu}(k,q)A^{SQ}_{c'vk}-\sum_{vv'vk} A^{SQ+q\star}_{cvk+q} g_{v'v\nu}(k-Q,q) A^{SQ}_{cv'k}`$,

see Eq. 49 here https://journals.aps.org/prb/pdf/10.1103/PhysRevB.105.085111 for more details.

Presently Xctph interfaces with BerkeleyGW (for computing $`A^{SQ}_{cvk}`$) and EPW for (computing $`g_{mn\nu}(k,q)`$).

Developed by Jonah Haber (jbhaber@stanford.edu).

# Documentation
## Ab-initio calculations
Prior to running Xctph a number of ab-initio calculations will need to be run. We recommend using 
the following directory structure.

1. `01-xct`    : Q=0 bse calculation (using BGW)
2. `02-xct-Q`  : Q!=0 bse caluclation (using BGW)
3. `03-ph`     : dfpt calculation (using ph.x in QE)
4. `04-elph`   : electron-phonon matrix element calculation (using epw.x in QE)
5. `05-xctph`  : directory for post-processing (empty for the moment)  

An example of this directory structure can be found in `xctph/example/LiF`.

## Xctph Instructions
Xctph contains the following 5 command line utilities which sould be run in the following order
to extract exciton-phonon matrix elements

1. Extract exciton expansion coefficients:
   
        Usage  : write_xct_h5.py -path_to_eigenvectors
        Output : 'xct.h5'

3. Extract the electron-phonon matrix elements:

       Usage  : write_eph_h5.py -dirname_epw -prefix nq nc nv
       Output : 'eph.h5'

5. Compute exciton-phonon matrix elements:

       Usage  : compute_xctph.py -fname_eph_h5 -fname_xctph_h5 -nbnd_xct
       Output : 'xctph.h5'

7. Print electron-phonon matrix elments:

       Usage  : print_eph.py -fname_eph_h5
       Output : 'eph.dat'

9. Print exciton-phonon matrix elments:
    
       Usage : print_xctph.py -fname_xctph_h5
       Output : 'xctph.h5'


Where the flags are as follows
1. `path_to_eigenvectors` : 
        path pattern to eigenvectors.h5, for example `../02-xct-Q/Q00\*/03-singlet/eigenvectors.h5`
2. `dirname_epw` : 
        directory name of the epw calculation, for example `../04-eph/`
3. `prefix` : 
        qunatum espresso prefix name, for example `LiF`
4. `nq` : 
        number of q-points on the full (reducible) grid for phonons, for example 8
5. `nc` : 
        number of conduction bands on the fine grid on which the BSE is solved, for example 1
6. `nv` : 
        number of valence bands on the fine grid on which the BSE is solved, for example 3
7. `fname_eph_h5` :
        path to the h5 file written by `write_eph_h5.py`, for example './eph.h5'
8. `fname_xctph_h5` :
        path to the h5 file written by `write_xct_h5.py`, for example './xct.h5'
9. `nbnd_xct` : 
        number of exciton states for which to compute the exciton phonon matrix element, for example 2

Detailed instructions for how to run this workflow for LiF can be found in `xctph/examples/LiF/05-xctph/readme.txt`.

# Requirements
1. Python 3+
2. scipy

# Installation
    conda create --name xctph
    conda activate xctph
    cd xctph
    pip install -e . 

After successful installation the command line utilities should be added to your python path,
so that whenever you are in the xcth conda enviornment you should have access to these scripts.

To test this type:
    `which compute_xctph.py`

To see which flags a utility takes, type:
    `compute_xctph.py -h`


