# Let's Build Swift

## Short, simple, automated steps for building Swift

So you'd like to build Swift on Linux? Perhaps to hack on the compiler or on the corelibs re-implementation of Foundation?

But it seems like it's complicated to setup and you just want to get it working right now?

You've come to the right place.

How to do it:

1. Go to your cloud provider of choice and create an instance as follows:

    - Ubuntu 14.04 LTS
    - at least 64 GB of disk on the main filesystem
    - optimized for compute 
    
      If you are using AWS, a `c4.8xlarge` is a good choice. If you go
      with something much lighter, like a `m3.medium`, it will literally
      take well over 10 hours to run a full build and test cycle. The
      tests alone take over 10 minutes on a c4.

2. upload this repo to the instance.

3. run ./go-all.sh

4. wait!

There is no 5th step.

If you don't want to have to maintain the network connection while these scripts are running, you might first run `tmux` after logging in in order to do all this work in a tmux session. You can detach from the tmux by doing `C-b d`, and attach to it again by doing `tmux attach -t 0`.

## What this does.

These are just scripts which automate the instructions from the Swift website. The scripts themselves are pretty self-explanatory. The main tricky part is downloading and install a few development dependencies that cannot be installed automatically through apt-get. These are version 3.6 of clang, and a more current version of cmake.

## Also, docker

If you want to install a more current version of Docker, there's also a script for that. You could even do the entire build within a docker container. Or you could run the constituent scripts within a docker container and commit the image after each step, if you wanted the ability to rollback the filesystem.



