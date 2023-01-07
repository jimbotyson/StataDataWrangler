* import data

import excel "https://www.ucl.ac.uk/~ccaajim/medicalXtrial.xlsx", sheet("medicalXtrial") firstrow clear

* data wrangling
** create new variables
* generate hdiff as the difference between hbefore and hafter.

generate hdiff = hafter - hbefore

/*
Generate two new ranked variables: incgroup and postsize following the rules:

    If income >=  3rd Quartile , incgroup = "high",
        if income < 1st Quartile  , incroup  = "low",
            else incgroup = "mid"

and

    If hdiff > median(hdiff), postsize = "large",
	    else postsize = "small"
*/

generate incgroup = 2
replace incgroup = 1 if income > 50500
replace incgroup = 3 if income < 36500

generate postsize = 1
replace postsize = 2 if hdiff > 2.17

/*
 variable and value labels

Give appropriate labels to all variables.

Give appropriate labels to the values of gender, smoker and incgroup.
*/

label variable gender "Sex"
label variable age "Age"
label variable income "Income"
label variable smoker "Smoker"
label variable hbefore "Levels of H before treatment"
label variable hafter "Levels of H after treatment"
label variable hdiff "Difference in levels of H after treatment"
label variable incgroup "Income Level"
label variable postsize "Greater than median difference in H"

label define genderl 1 "Female" 2 "Male"
label values gender genderl
label define postsizel 1 "Less than median" 2 "Greater than or equal to median"
label values postsize postsizel
label define incgroupl 1 "High income" 2 "Mid income" 3 "Low income"
label values incgroup incgroupl

* summary descriptives
* Generate  detailed summary descriptive statistics for hbefore, hafter and hdiff.

summarize hbefore hafter hdiff, detail

* box plots
* Make box plots of hbefore, hafter and hdiff as a function of gender.  Put appropriate titles on the plots.  Save the plots.

graph box hafter, over(gender) title("Levels of H after treatment by Sex")
graph export "C:\Users\DELL\Documents\Data\Stata\StataDataWrangler\haftersex.png", replace

* analyses
/*
Make a custom table showing the mean, sd and skewness for hafter tabulated by gender and smoker.  Do not display totals.  Save the table as a word document.
*/

table (smoker)(gender), ///
	statistic(mean hafter) ///
	statistic(sd hafter) ///
	statistic(skewness hafter) ///
	nototals

putdocx begin
putdocx collect
collect title "Hafter by Smoker and Sex"
putdocx save smokesex, replace

/*
Test for any association between the variables gender and smoker
*/

tabulate gender smoker, expected chi2
tabulate incgroup gender, expected chi2

/*
Test to determine whether gender, smoker or income group affect the mean level of hafter.  Where appropriate, use post-hoc test of pairwise comparisons.
*/

robvar hafter, by(gender)
ttest hafter, by(gender) unequal

oneway hafter incgroup, sidak

/*
Create regression models to test for the effects of

 * age
 * age and gender
 * gender and smoker
 * any interactions between gender and smoker

on hafter.

Describe your results.
*/

regress hafter age

regress hafter age i.gender

* to include smoker, we first encode it numerically using encode

encode smoker, gen(nsmoke)
regress hafter age i.gender i.nsmoke

* the model with interactions only

regress hafter gender#i.nsmoke







