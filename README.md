# Let's Build Swift

## Short, simple, automated steps for building Swift

So you'd like to build Swift on Linux? Perhaps to hack on the compiler or on the corelibs re-implementation of Foundation?

But it seems like it's complicated to setup and you just want to get it working right now?

You've come to the right place.

How to do it:

1. Go to your cloud provider of choice and create an instance as follows:

    - Ubuntu 14.04 LTS (e.g., the AWS `ami-d732f0b7`)
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

These are just scripts which automate the instructions from the Swift website. The scripts themselves are pretty self-explanatory. The main tricky part is downloading and installing a few development dependencies that cannot be installed automatically through apt-get. These are version 3.6 of clang, and a more current version of cmake.

Note that, by default, this script builds a _debug_ configuration of the Swift compiler and runs tests. That is the effect of the command `utils/build-script -t` in the `go-03-build.sh` script. If instead you simply want to build Swift in its _release_ configuration, then instead you should do `utils/build-script -r`.

## Compatibility

This script is known good for Ubuntu 14.04 LTS, as supplied by AMI `ami-d732f0b7`, and with the state of the apt-get repos and the Swift source repos as they exist on 2016-10-30, 10:31am SF time.

## Also, docker

If you want to install a current version of Docker on your ubuntu box, there's also a script for that. You could even do the entire build within a docker container. Or you could run the constituent scripts within a docker container and commit the image after each step, if you wanted the ability to rollback the filesystem.



