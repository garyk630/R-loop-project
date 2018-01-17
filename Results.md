# Interpretation
* Q1: While a gene has no introns, every increase of transcription frequency (mRNA/hour) increases 0.14381 R-loop formation (mean A.U.) (t=5.968, df=307, p<0.05). The result shows transcription frequency has a significant and positive effect on R-loop formation. It matches what I expected and to the paper’s results.  
* Q2: For average transcription frequency (mRNA/hour), a intron-containing gene creates 0.10786 less R-loop formation (mean A.U.) than a gene without introns (t=0.473, df=307, p>0.05). The result shows a similar trend between genes with and without introns in the published paper. However, it is not significant when you used gene list with a wide range of transcription frequency.
* Interaction term: While a gene has introns, the slope of average transcription frequency on R-loop formation is 0.107 less than a gene has no introns (t=0.107, df=307, p>0.05). However, the interpretation is not significant because there is not a significant interaction between intron-containing status and transcription frequency on R-loop.
# Limitations
* In “intron-containing genes” variables, “no” group has higher frequency counts than “yes” group. It could be the bias and reason that the result of Q2 is not significantly different between “yes” and “no” groups. 
# Possible confounding variable: 
* Every gene could have other specific features ex: gene length, ATCG contents…etc impacting R-loop formation. 
* R-loop formation exists in a particular timing in the transcription process. 
# Implications and future research
* My analysis did confirm high transcription frequency can lead to more R-loops
The paper only focused on genes with high transcription frequency and concluded that intron-containing genes with high transcription frequency can decrease R-loop formation. However, my data includes genes with all different range of transcription frequency. This might explain why I did not get a similar conclusion from intron-containing genes analysis in my GLM model. It also confirms that the paper’s conclusion is only applicable to a particular population in stead to all other genes generally. 
I will include more gene features for my GLM model
It will be interesting to study whether intron-containing genes in humans can produce less R-loops.
