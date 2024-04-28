# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

The reason for adopt this approach is to elude the problem of having boats with no enough space to store all the data of a specific timelapse, and wasting a lot of space in others

The reason for not adopting this approach is beacause if you want to see the data it will be slow and unefficient

## Partitioning by Hour

The reason for adopt this approach is beacause it would make the task of analyzing the data easier

The reason for not adopting this approach is because you maybe get out of space in a boat while having others with almost any data

## Partitioning by Hash Value

The reason for adopt the approach is beacause you will be distributing the data evenly, avoiding the case of a boat getting to much data to store

The reason for don't adopt this approach because if you don't want to search for a especific time, and instead for a range, you will need to search across all the boats. But the fact that a hash map is used make the query time decrease in comparison to a complete scan of the database
