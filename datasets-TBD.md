---
layout: default
title: AI4NET Lab Datasets
permalink: "/datasets"
---


{% warn  <i class="fa fa-spinner"></i> Link to released datasets and artefacts  %}

{% if false %}
---
layout: default
title: DataCom AI4NET Lab
tagline: AI4NET Datasets
---

This page collects a list of pointers toward shared datasets



# Traffic classification

We have collected, sanitized, anonimized a carrier grade dataset for application identification research. The dataset has been used in our [research on traffic classification](/ai4net/prj/tc)


![]({%imgurl%}//dataset-appclassnet.png){: width="600px"} 

The {% icon fa-cube %} [dataset](https://onebox.huawei.com/p/3e923de3c59846bab743981f33632096) is hosted on onebox. A description of the dataset is given in the reference below. 

{% bibliography --query @*[topic=tc] --file datasets.bib %}


# Active Web Quality of Experience experiments

In our [research on Quality of Experience](/ai4net/prj/qoe), we devised
methods for accurate estimation of QoE metrics. Together with  Orange Labs, we released a  synthetically generated datasets, under many controlled network conditions.  

![]({%imgurl%}/logo-orange.png)![]({%imgurl%}/dataset-webqoe-tnsm.png){: width="600px"}

The dataset {% icon fa-cube %} [dataset](https://figshare.com/articles/dataset/Revealing_QoE_of_Web_Users_from_Encrypted_Network_Traffic/12459293) is useful for learning QoE of individual Web brosing sessions.

{% bibliography --query @*[topic=qoe-web1] --file datasets.bib %}


# Degradation of Web Quality of Experience  

In our [research on Quality of Experience (QoE)](/ai4net/prj/qoe), we additionally  devised methods for timely detection of QoE degradation.

Together with  Orange Labs, we released a {% icon fa-cube %} [dataset](https://figshare.com/articles/dataset/Detecting_Degradation_of_Web_Browsing_Quality_of_Experience/13089854
), with annotated ground truth, which is useful for detecting degradation of Web browsing QoE.

![]({%imgurl%}/logo-orange.png)![]({%imgurl%}/dataset-webqoe-cnsm.png){: width="600px"}

More information concerning the datasets is given in the references below:

{% bibliography --query @*[topic=qoe-web2] --file datasets.bib %}


----

# Real User Monitoring of Web Quality of Experience 

In our [research on Quality of Experience](/ai4net/prj/qoe), we also used real human subjects.

Together with Wikipedia  and the Wikimedia foundation, we launched a 
6-month long campaign involving real users in their normal browsing activity.

![]({%imgurl%}/logo-wikipedia.png)![]({%imgurl%}/dataset-webqoe-wikipedia.png){: width="600px"}

The {% icon fa-cube %}[dataset](https://figshare.com/articles/dataset/A_Large_Scale_Study_of_Wikipedia_Users_Perceived_Quality_of_Experience/11365607
) pertaining to the quality of experience of hundreds thousands of Wikipedia users, which provide explicit feedback about their browsing experience.

More information concerning the datasets is given in the references below:

{% bibliography --query @*[topic=qoe-rum] --file datasets.bib %}


----

# Anomaly detection of Router KPI 

In our [research on Anomaly Detection](/ai4net/prj/ad), we have gathered and collected a set of external datasets for multi-variate time-series KPI anomaly detection, with annotated ground truth.

![]({%imgurl%}/dataset-anomaly-kpi.png){: width="600px"}

These {% icon fa-cube %}[dataset](https://rnd-gitlab-eu-c.huawei.com/prc-ai4net/anomaly-detection/public-data) are available in our internal repo.

More information concerning the datasets is given in the references below:

{% bibliography --query @*[topic=ad] --file datasets.bib %}

----

# WLAN Dynamic Radio Ressource Management
 
Changepoint dataset with ground truth, upcoming (planned release end of 2022, contact us if you're interested) 

{% endif %}
