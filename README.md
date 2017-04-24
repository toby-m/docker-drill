# Apache Drill embedded mode docker image for local querying

Build and tag the container like this:

```
docker build -t docker-drill .
```

Use like this:

```
function drill-tsv {
  docker run --rm -it -v $PWD:/data/tsv -p 8047:8047 docker-drill
}

function drill-json {
  docker run --rm -it -v $PWD:/data/json -p 8047:8047 docker-drill
}

function drill-csv {
  docker run --rm -it -v $PWD:/data/csv -p 8047:8047 docker-drill
}
```

When it runs, you will be in embedded mode and can `USE dfs.json;` or whichever flavour you want and begin querying.

## Other helpful bits
Write out as CSV

```
ALTER SESSION SET `store.format`='csv';
CREATE TABLE output AS SELECT * FROM...;
```
