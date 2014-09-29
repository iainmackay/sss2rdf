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

* `-fFormat` Specify an output RDF format

* `-v` Request display of sss2rdf version

* `-uURI` Specifies a base URI for the survey dataset

* `-p1|2|3|4` Specifies the maximum level of conversion

* `-dFilename` Specifies the output RDF file name

* `-cURI` Specifies a context URI

* `-sfile|bigdata` Specifies the destination for the RDF

* `-tTitle` Specifies a title for the dataset (defaults to Triple-S survey title)

* `-eEndpoint` Specifies the endpoint for the bigdata triple store

* `-x` If specified deletes any triples already in the specified context

* `-l` Specifies maximum number of triples to generate

* `-o` Specifies number of triples to skip before generating

### Execution phases

1. Reference metadata only
2. Reference metadata plus structural metadata
3. All metadata plus case data as ASCII records only
4. All metadata plus case data as ASCII records plus case data as triples
