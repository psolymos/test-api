library(httr)
library(readr)

# json text --> list
r <- GET("http://peter.solymos.org/test-api/file.json",
    write_memory())
content(r)

# csv --> tibble
r <- GET("http://peter.solymos.org/test-api/file.csv",
    write_memory())
content(r)

# txt --> text --> data frame
r <- GET("http://peter.solymos.org/test-api/file.txt",
    write_memory())
read.table(text=content(r)) # use text instead of file

# zip
r <- GET("http://peter.solymos.org/test-api/file.zip",
    write_memory())
content(r)

read.csv(content(r))
content(r) # raw
rawToBits(content(r))
readBin(content(r))


tmp <- tempfile()
r1 <- httr::GET("http://peter.solymos.org/test-api/file.zip",
    write_disk(tmp))
readr::read_csv(tmp)


td <- tempdir()
filecon <- file(file.path(td, "data.zip"), "wb")
writeBin(y$content, filecon) # this works nicely
close(filecon)
zipF <- paste0(td, "\\data.zip")
unzip(zipF, exdir = td)


# Save a very large file## Not run:
r3 <- GET("http://www2.census.gov/acs2011_5yr/pums/csv_pus.zip",
    write_disk("csv_pus.zip"), progress())

