1. Put your ``.gitconfig`` file and ``.ssh`` directory with this Dockerfile
    If you don't want this feature, please remove coresponding lines.
2. Build image
    ``docker build -t (tag name you want) .``
    
    I use ``neovim`` as an example tag for the next step.
    
    If you remove ``-t tag`` part, you need to give coresponding image index.
3. Create a docker machine with this image
    ``docker run -ti -v /some/dir/you/want/to/work/on:/work_space neovim``

    or, if you are using M$

    ``docker run -ti -v C:/Users/you/dir/you/want/to/work/on:/work_space neovim``

    Your directory will be mounted to ``/work_space``.

    Add ``--rm`` if you don't want to keep your settings in the docker machine.
