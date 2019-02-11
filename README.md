# Let's Build Swift on Linux

## Short, simple, scripts for building Swift on Linux

This is set of shell scripts to build Swift on Linux. They just automate the instructions from the Swift website.

These scripts provision a substantial EC2 machine and build Swift on plain vanilla Ubuntu in less than one hour.

How to do it:

- EITHER: Ensure you have the Amazon's AWS command line tools
  intallaed (`brew install awscli`), and configured with suitable
  credentials, and then update the script `create_instance.bash` to
  refer to your AWS ssh key and to your desired EC2 security
  groups. Then, run `create_instance.bash`
   
- OR: Go to your cloud provider of choice and create an instance as
  follows:

    - Ubuntu 16.04 LTS (e.g., the AWS `ami-0f26d4c9992650142`)
    - at least 128 GB of disk on the main filesystem
    - optimized for compute 
      
      If you are using AWS, a `c4.8xlarge` is a good choice. If you go
      with something much lighter, like a `m3.medium`, it will take
      many hours (over 10?) to run a full build and test cycle. The
      tests alone take over 10 minutes on a c4.

- Upload this repo to the instance.

- Run `./go-all.sh --tag "swift-4.2-RELEASE"` in order to build the
  Swift 4.2 release build.
   
But what if you want to build something besides 4.2?


The arguments to `go-all.sh` are simply appended to a call to `swift/utils/update-checkout --clone`. It controls which commit of swift, and other repos, are checked out. That script's help output can provide more guidance on different arguments it accepts.

If you provide no arguments, the default behavior is to build the HEAD of master. This may or may not work. You can also specify build "schemes", using a format like `--scheme <schemename>`. I am no expert. The only thing I have seen build completely successfully is that tag.

By the way, if you don't want to have to maintain the network connection while these scripts are running, you might first run `tmux` after logging in in order to do all this work within a tmux session. You can detach from the tmux session by doing `C-b d`, and attach to it again by doing `tmux attach`.

## Compatibility

This is known good with the AMI specified in the script (Ubuntu 16.04.5), with the commit tag specified above.

## Resources

I don't (yet!) know much about building the Swift compiler. These resources seem like good starting points:

- [Apple's README on building Swift](https://github.com/apple/swift)
- [Harlan Haskins & Robert Widmann - Becoming An Effective Contributor to Swift - YouTube](https://www.youtube.com/watch?v=oGJKsp-pZPk)
- [Swift CI Server, showing what is expeced to build](https://ci.swift.org)
- [forum thread on contributing](https://forums.swift.org/t/what-should-i-learn-if-i-want-to-contribute-to-the-swift-compiler/18144)
- [modocache’s notes](https://modocache.io/getting-started-with-swift-development)

## Also, docker

If you want to install a current version of Docker on your ubuntu box, there's also a script for that. You could even do the entire build within a docker container. Or you could run the constituent scripts within a docker container and commit the image after each step, if you wanted the ability to rollback the filesystem. 

I have not tested this recently!
