* import data

import delimited https://www.ucl.ac.uk/~ccaajim/results.csv, clear

* data management

egen avxm = rowmean(maths english history)

replace avxm = round(avxm)


gen stream = 2
replace stream = 3 if avxm >= 60
replace stream = 1 if avxm < 50

label variable avxm "Average Score"
label variable gender "Gender"
label variable teacher "Class Teacher"
label variable stream "Stream"
label variable maths "Mathematics"
label variable english "English Language"
label variable history "History"

label define genders 1 "Female Students" 2 "Male Students"
label define streams 1 "Top" 2 "Mid" 3 "Low"
label define classes 1 "Class One" 2 "Class Two" 3 "Class Three"

label values gender genders
label values stream streams
label values teacher classes

/* creating the table */

* import data

import delimited https://www.ucl.ac.uk/~ccaajim/results.csv, clear

* data management

egen avxm = rowmean(maths english history)

replace avxm = round(avxm)


gen stream = 2
replace stream = 3 if avxm >= 60
replace stream = 1 if avxm < 50

label variable avxm "Average Score"
label variable gender "Gender"
label variable teacher "Class Teacher"
label variable stream "Stream"
label variable maths "Mathematics"
label variable english "English Language"
label variable history "History"

label define genders 1 "Female Students" 2 "Male Students"
label define streams 1 "Top" 2 "Mid" 3 "Low"
label define classes 1 "Class One" 2 "Class Two" 3 "Class Three"

label values gender genders
label values stream streams
label values teacher classes

collect: tabulate teacher gender, chi2 expected

collect dims

collect levelsof result

return list

collect title "Test of Independence"

collect layout (result) ()

collect layout (result[N])()

collect layout (result[N chi2 p])()

collect label list result, all

collect label levels result chi2 "Test of Association" N "Count" p "Prob(Chi)", modify

