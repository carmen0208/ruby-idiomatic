## GEMLOVE PART1 

#### How to write a gem plugin and regist command line

* [example](../gemlove)

#### Commnand line

go to `gemlove` directory

```sh
RUBYLIB=./lib:$RUBYLIB gem help commands
#...
#lovecarmen             Tell the world of your love for a gem
#...
```

```sh
RUBYLIB=./lib:$RUBYLIB gem lovecarmen --help
# Common Options:
#   -h, --help                       Get help on this command
#   -V, --[no-]verbose               Set the verbose level of output
#   -q, --quiet                      Silence commands
#       --config-file FILE           Use this config file instead of default
#       --backtrace                  Show stack backtrace on errors
#       --debug                      Turn on Ruby debugging
#
#
# Arguments:
#   GEM_NAME                the name of the gem you wish to endorse
#
# Summary:
#   Tell the world of your love for a gem
#
# Description:
#   Records your appreciation for a gem on gemlovecarmen learning

```

```sh
RUBYLIB=./lib:$RUBYLIB gem lovecarmen fattr
#Under construction....
```
