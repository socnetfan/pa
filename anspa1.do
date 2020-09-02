
set more off

ssc install estout

eststo model1: xtmixed dailyactivity day1 female i.female#c.day1 i.race_2 i.race_2#c.day1 ////
               i.religion i.religion#c.day1 bmi c.bmi#c.day1 extraversion c.extraversion#c.day1 ////
			   agreeableness c.agreeableness#c.day1 conscientiousness c.conscientiousness#c.day1 ////
			   neuroticism c.neuroticism#c.day1 openness c.openness#c.day1 depression c.depression#c.day1 ////
			   local i.weekdatecat i.datenote tmax tmin precip snow snowd sleepmins classnum jdailyactivity i.female#c.jdailyactivity deg ////
			   if complypercent>=80 & date1<=20170513 || i: day1, mle cov(un) var
estat ic 			   
eststo model2: xtmixed steps day1 female i.female#c.day1 i.race_2 i.race_2#c.day1 ////
               i.religion i.religion#c.day1 bmi c.bmi#c.day1 extraversion c.extraversion#c.day1 ////
			   agreeableness c.agreeableness#c.day1 conscientiousness c.conscientiousness#c.day1 ////
			   neuroticism c.neuroticism#c.day1 openness c.openness#c.day1 depression c.depression#c.day1 ////
			   local i.weekdatecat i.datenote tmax tmin precip snow snowd sleepmins classnum jsteps i.female#c.jsteps deg ////
			   if complypercent>=80 & date1<=20170513 || i: day1, mle cov(un) var			   
estat ic 
eststo model3: xtmixed activemins day1 female i.female#c.day1 i.race_2 i.race_2#c.day1 ////
               i.religion i.religion#c.day1 bmi c.bmi#c.day1 extraversion c.extraversion#c.day1 ////
			   agreeableness c.agreeableness#c.day1 conscientiousness c.conscientiousness#c.day1 ////
			   neuroticism c.neuroticism#c.day1 openness c.openness#c.day1 depression c.depression#c.day1 ////
			   local i.weekdatecat i.datenote tmax tmin precip snow snowd sleepmins classnum jactivemins i.female#c.jactivemins deg ////
			   if complypercent>=80 & date1<=20170513 || i: day1, mle cov(un) var	
estat ic 
eststo model4: xtmixed activitycalories day1 female i.female#c.day1 i.race_2 i.race_2#c.day1 ////
               i.religion i.religion#c.day1 bmi c.bmi#c.day1 extraversion c.extraversion#c.day1 ////
			   agreeableness c.agreeableness#c.day1 conscientiousness c.conscientiousness#c.day1 ////
			   neuroticism c.neuroticism#c.day1 openness c.openness#c.day1 depression c.depression#c.day1 ////
			   local i.weekdatecat i.datenote tmax tmin precip snow snowd sleepmins classnum jactivitycalories i.female#c.jactivitycalories deg ////
			   if complypercent>=80 & date1<=20170513 || i: day1, mle cov(un) var			   			   			   
estat ic 			   
esttab model1 model2 model3 model4 using anspa1.csv, ci nopa stats(N) replace
eststo clear














