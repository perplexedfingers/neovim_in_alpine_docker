1. Put your ``.gitconfig`` file and ``.ssh`` directory with this Dockerfile

2. Build image

    docker build -t (tag name you want) .

3. Create a docker machine with this image

        docker run -ti -v /some/dir/you/want/to/work/on:/work_space neovim

    or, if you are using M$

        docker run -ti -v C:/Users/you/dir/you/want/to/work/on:/work_space neovim

    And your directory will be mounted to ``/work_space``.

    Add ``--rm`` if you don't want to keep your settings in the docker machine.
