---
layout: default
title: AI4NET Lab Publications
permalink: "/publications"
---

**Legend**
 - Type: 
<span class="badge badge-pill btn-primary" style="width: {{ badgeWidth }}">Journal</span>
<span class="badge badge-pill btn-success" style="width: {{ badgeWidth }}">Conference</span>
<span class="badge badge-pill btn-secondary" style="width: {{ badgeWidth }}">Tech.Rep.</span>
 - Extra: 
<span class="badge badge-pill btn-warning" style="width: {{ badgeWidth }}"> {% icon fa fa-star %} Award  </span>
<span class="badge badge-pill btn btn-outline-dark" style="width: {{ badgeWidth }}"> <a href="{{ entry.arxiv }}"> arXiv <i class="fa fa-external-link"></i></a> </span> 
<span class="badge badge-pill btn btn-outline-dark" style="width: {{ badgeWidth }}">   <a href="{{ entry.dataseturl }}"> {% icon fa-cube %} Data <i class="fa fa-external-link"></i></a> </span> <span class="badge badge-pill btn btn-outline-dark" style="width: {{ badgeWidth }}">   <a href="{{ entry.demourl }}"> {% icon fa-cogs %} Demo {% icon fa-external-link %} <i class="fa fa-external-link"></i></a> </span>  

<strong> Year: </strong> 
<!-- <button class="btn badge btn-default btn-xs">-->
{%- for year in (2020..2023) reversed -%} [{{ year }}](#publications{{year}})<span class="caret"></span> / {% endfor %}  [{{ 2019 }}](#publications2019) 


## <A name="publications2024"></a>2024 <span class="badge">  
{% bibliography --file 2024 --template bib  %}

## <A name="publications2023"></a>2023 <span class="badge">  
{% bibliography --file 2023 --template bib  %}

## <A name="publications2022"></a>2022 <span class="badge">   
{% bibliography --file 2022 --template bib  %}

## <A name="publications2021"></a>2021 <span class="badge">   
{% bibliography --file 2021 --template bib  %}

## <A name="publications2020"></a>2020 <span class="badge">   
{% bibliography --file 2020 --template bib  %}

## <A name="publications2019"></a>2019 <span class="badge">   
{% bibliography --file 2019 --template bib  %}

 
