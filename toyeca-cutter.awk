BEGIN {
	FS = ","
}

NR==1 { #First line is the headers for the columns
        split(c, ca, ",")  #Override comma as a separator with -F

        #Create Associative Array with the headers we want
        for (i = 1 ; i <= length(ca) ; i++) {
                gsub(/ /, "", ca[i])
                cm[ca[i]] = 1
        }

        #Create Associative Array with the column numbers we want
        j=1
        for (i = 1 ; i <= NF ; i++) {
                if (cm[$i] == 1) {
                        ce[$i] = i
                        j++
                }
        }

        #Create array with column numbers in order provided on command line
        j=1
        for (i in ca ) {
                cc[j]=ce[ca[i]]
                j++
        }

        #Bail if no headers matched.
        if (length(cc) == 0) {
                print "No headers matched."
                exit 1
        }
}

#For all lines
{
        ci = "" #Start with 1st field

        #Print needed Fields
        for (i in cc ) {
                                if (ci == "") { #First colum
                        ci = $(cc[i]) #Just add the column
                } else { #otherwise
                                        ci = ci FS $(cc[i]) #Add a separator and the new column
                                }
        }
        print ci #Print what is left
}
