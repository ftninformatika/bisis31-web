<#include "_base_gbbg.ftl"
><#assign webS=""
><@autor1/><@naslov/><@deoKnj/><@naslovDeo/><@mesto/><@izdavac/><@godIzd/><@signaturaX/><@signatura1/><#--
--><#if aut!=""
     ><#assign webS=webS+aut
     ><#if nas!="" ||deo!="" ||nasDeo!="" ||mes!="" ||izd!="" ||god!="" 
          ><#assign webS=webS+":&nbsp;"
     ></#if
></#if 
><#if nas!=""
     ><#assign webS=webS+nas
     ><#if deo!="" ||nasDeo!="" ||mes!="" ||izd!="" ||god!=""  
          ><#assign webS=webS+",&nbsp;"
     ></#if
></#if     
><#if deo!=""
     ><#assign webS=webS+deo
     ><#if nasDeo!="" ||mes!="" ||izd!="" ||god!="" 
          ><#assign webS=webS+".&nbsp;"
     ></#if
></#if 
><#if nasDeo!=""
     ><#assign webS=webS+nasDeo
     ><#if mes!="" ||izd!="" ||god!="" 
          ><#assign webS=webS+".&nbsp;-&nbsp;"
     ></#if
></#if 
><#if mes!=""
     ><#assign webS=webS+mes
     ><#if izd!="" ||god!="" 
          ><#assign webS=webS+":&nbsp;"
     ></#if
></#if 
><#if izd!=""
     ><#assign webS=webS+izd
     ><#if god!="" 
          ><#assign webS=webS+",&nbsp;"
     ></#if
></#if 
><#if god!=""
     ><#assign webS=webS+god     
></#if 

><#if signX!="" ||sign1!=""  
          ><#assign webS=webS+"<BR>"
></#if

><#assign webS=webS+"<B>"+signX+"</B>"
><#if signX!="" && sign1!=""  
          ><#assign webS=webS+",&nbsp;"
></#if
><#assign webS=webS+sign1

>${webS}