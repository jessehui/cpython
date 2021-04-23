/* Minimal main program -- everything is loaded from the library */

#include "Python.h"

#ifdef MS_WINDOWS
int
wmain(int argc, wchar_t **argv)
{
    return Py_Main(argc, argv);
}
#else
int
main(int argc, char **argv)
{
#ifdef FOR_OCCLUM
    char *python_program = getenv("PYTHONPATH");
    if (python_program == NULL) {
       return Py_BytesMain(argc, argv);
    }
    char** argv_new = calloc(1, sizeof(char*)*(argc+1)); // for NULL
    argv_new[0] = strdup(python_program);
    for (int i = 1; i < argc; i++) {
        argv_new[i] = strdup(*(++argv));
    }
    return Py_BytesMain(argc, argv_new);
#else
    return Py_BytesMain(argc, argv);
#endif
}
#endif
