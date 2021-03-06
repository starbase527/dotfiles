
import sys

def main():
    import atexit
    import os
    import os.path as osp
    from os.path import join as joinpath
    import readline

    histfile = joinpath(
                os.environ.get("XDG_CACHE_DIR", osp.expanduser("~/.cache")),
                "python3", "history")
    try:
        readline.read_history_file(histfile)
        readline.set_history_length(10000)
    except FileNotFoundError:
        pass

    if os.path.isdir(os.path.dirname(histfile)):
        atexit.register(readline.write_history_file, histfile)

if __name__ == '__main__' and sys.version_info.major > 2:
    main()

