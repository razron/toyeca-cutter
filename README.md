# toyeca-cutter
Small awk utility to cut specific headers(columns) from a delimited file

Usage - 

awk -F"delimiter" -f toyeca-cutter.awk -v c="col1, col2, col3, col4" my_file.csv

Arguments:
	c - Space seperated list of column names (headers)
