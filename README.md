sss2rdf - a utility to convert Triple-S data to RDF
=======

This utility takes a Triple-S survey dataset, in the form of a Triple-S version 1.2 XML schema
plus an associated data file, and creates an RDF representation in one of a selection of RDF serialisation formats.
The RDF can optionally be uploaded to a Bigdata triple store as it is generated.

Executing sss2rdf
-----------------

sss2rdf is run from command line as follows:

```
sss2rdf [options] sss-file
```

where `sss-file` identifies the Triple-S XML 1.2 file, and the ASCII data is assumed to have the same
path and name with extension .asc

### Summary of options

* `-fFormat` Output RDF format

* `-v` Display sss2rdf version

* `-uURI` Base URI for the survey dataset

* `-p1|2|3|4` Maximum detail of conversion

* `-dFilename` Output RDF file name

* `-cURI` Context URI

* `-sfile|bigdata` Destination for the RDF

* `-tTitle` Dataset title

* `-eEndpoint` Endpoint of triple store

* `-x` Delete existing context

* `-l` Limit number of triples

* `-o` Triples to skip

* '-b' Batch size to upload

### Output formats

You can select any of the following RDF serialisation formats:

* n3
* nquads
* nt
* pretty-xml
* trig
* trix
* turtle
* xml

### Level of detail in export

1. Reference metadata only
2. Reference metadata plus structural metadata
3. All metadata plus case data as ASCII records only
4. All metadata plus case data as ASCII records plus case data as triples

### Base URI

By default the nodes in the graph created by sss2rdf will be 'blank' nodes,
i.e. their unique identity is an arbitrary UUID chosen by sss2rdf.
This means that the graph nodes can be located only by matching their properties, e.g. the survey title.
A base URI is a URI for the survey itself, and all of its components then have their unique URI
using this base URI as a prefix.

### Context URI

Triple stores supporting SPARQL 1.1 support "named graphs" or contexts, where each triple is assigned to a graph
identified by a URI. Triples without such a URI are added to a default unnamed graph.
Use this option to specify a context for your triples.
If you are generating an output file, specify `nquads` as your output format to get the context information into the file.
If you are uploading to a triple store, then the context if specified will be added anyway.

### Destination

You can specify output either to a file or to a Bigdata triple store
(others may be supported in due course). If you are uploading to a triple store then
sss2rdf needs to know an HTTP endpoint for the store from the `-e` option.

### Triple store endpoint

This is required if the destination is bigdata. It defaults to a local triple store, i.e.
`http://localhost:8000/bigdata` which is the default for bigdata hosted as the first web app on
a Tomcat server.
