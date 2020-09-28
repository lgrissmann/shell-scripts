
# find-by-date

## Description
List files within specific folder which have been modified between two dates.'

## Usage 

```
$ ./find-by-date <folder> <dt_from> <dt_to>
```

executes:

```
$ find <folder> -type f -newermt <dt_from> ! -newermt <dt_to>
```

# set-alias

## Description

A set of handy bash aliases. The script generates a file with the aliases and add the call on the .bashrc file.

## Usage

```
$ ./set-alias.sh
```

You need to execute it just one time. After the command been executed, check your .bashrc file.
