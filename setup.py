from setuptools import setup, find_packages

setup(
    name='xctph',
    version='1.1.2',
    description='Package for computing exciton phonon matrix elements.',
    long_description='Package for computing exciton phonon matrix elements.',
    author='Krishnaa Vadivel',
    author_email='krishnaa.vadivel@yale.edu',
    packages=find_packages(where='src'),
    package_dir={'': 'src'},
    install_requires=[
        'numpy', 
        'scipy', 
        'h5py', 
        'xmltodict', 
        'setuptools',
        'fp_workflow',
    ],
    # scripts=[     # Does not seem to work.
    #     'xctph/write_eph_h5.py',
    #     'xctph/write_xct_h5.py',
    #     'xctph/compute_xctph.py',
    #     'xctph/print_eph.py',
    #     'xctph/print_xctph.py',
    # ]
)
