from libcpp.vector cimport vector


def entrypoint():
    do_something()


cpdef entrypoint2():
    do_something()


cdef do_something():
    cdef vector[int] vector_of_ints = vector[int]()
    vector_of_ints.push_back(3)
    print("Done!")