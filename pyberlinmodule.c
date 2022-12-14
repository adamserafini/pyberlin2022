#define PY_SSIZE_T_CLEAN
#define Py_LIMITED_API 3
#include <Python.h>

static PyObject *
pyberlin_hello(PyObject *self)
{
    return Py_BuildValue("i", 1);
}

static PyMethodDef PyBerlinMethods[] = {
    {"hello", pyberlin_hello, METH_NOARGS, "Hello PyBerlin!"},
    {NULL, NULL, 0, NULL}        /* Sentinel */
};

static struct PyModuleDef pyberlinmodule = {
    PyModuleDef_HEAD_INIT,
    "pyberlin",   /* name of module */
    NULL,     /* module documentation, may be NULL */
    -1,       /* size of per-interpreter state of the module,
                 or -1 if the module keeps state in global variables. */
    PyBerlinMethods
};

PyMODINIT_FUNC
PyInit_pyberlin(void)
{
    return PyModule_Create(&pyberlinmodule);
}