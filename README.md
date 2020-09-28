
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
