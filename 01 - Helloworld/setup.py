from setuptools import setup, find_packages, Extension
from Cython.Build import cythonize

setup(
    name="example",
    version="1.0.0",
    ext_modules=cythonize(
        [
            Extension(
                name="example",
                sources=["src/main.pyx"],
            )
        ],
        compiler_directives={
            "language_level": 3,
        },
    ),
    packages=find_packages(),
)
