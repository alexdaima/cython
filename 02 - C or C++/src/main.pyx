from libcpp.vector cimport vector


def do_something():
    cdef vector[int] vector_of_ints = vector[int]()
    vector_of_ints.push_back(3)