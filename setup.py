from setuptools import setup, find_packages

setup(
    name='xctph',
    version='1.1.1',
    packages=find_packages(where='./'),
    install_requires=[
        'numpy', 
        'scipy', 
        'h5py', 
        'xmltodict', 
        'setuptools'
    ],
    author='Krishnaa Vadivel',
    author_email='',
    description='Package for computing exciton phonon matrix elements.',
    scripts=[
        'xctph/write_eph_h5.py',
        'xctph/write_xct_h5.py',
        'xctph/compute_xctph.py',
        'xctph/print_eph.py',
        'xctph/print_xctph.py',
    ]
)
