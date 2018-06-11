<#include "_koncept_gbbg.ftl"
><#macro signatura1
 ><#assign sign1=""
 ><#assign old=","
 ><#if f996?exists               
      ><#list f996 as field
           ><#assign val=""
           ><#assign allSF="d"     
           ><@field996i field/><#-- 
           --><#if val!="X" && val!="XS"  
                    ><#assign val=""
                    ><#assign allSF="d"     
                    ><@field996 field/><#-- 
                    --><#if  val!="" & old?index_of(","+val+",")=-1
                           ><#assign old=old+val+","
                           ><#if sign1!=""
                                ><#assign sign1=sign1+",&nbsp;"
                           ></#if   
                           ><#assign sign1=sign1+val
                    ></#if 
           ></#if               
      ></#list     
 ></#if 
></#macro
><#macro signaturaX
 ><#assign signX=""
 ><#assign old=","
 ><#if f996?exists               
      ><#list f996 as field
           ><#assign val=""
           ><#assign allSF="d"     
           ><@field996i field/><#-- 
           --><#if val="X" || val="XS"  
                    ><#assign val=""
                    ><#assign allSF="d"     
                    ><@field996 field/><#-- 
                    --><#if  val!="" & old?index_of(","+val+",")=-1
                           ><#assign old=old+val+","
                           ><#if signX!=""
                                ><#assign signX=signX+",&nbsp;"
                           ></#if   
                           ><#assign signX=signX+val
                    ></#if 
           ></#if               
      ></#list     
 ></#if 
></#macro


><#macro signatura
 ><#assign sign=""
 ><#assign old=","
 ><#if f996?exists               
      ><#list f996 as field 
           ><#assign val=""
           ><#assign allSF="d"     
           ><@field996 field/><#-- 
           --><#if  val!="" & old?index_of(","+val+",")=-1
                 ><#assign old=old+val+","
                 ><#if sign!=""
                    ><#assign sign=sign+",&nbsp;"
                 ></#if   
                 ><#assign sign=sign+val
          ></#if       
      ></#list     
 ></#if  
 
></#macro

><#macro autor
 ><#assign val=""
 ><#assign aut=""
 ><#if f700?exists               
      ><#list f700 as field 
           ><#assign allSF="ab"     
           ><@field700 field/><#-- 
           --><@toUpperFirst/><#--
           --><#assign aut=val
           
      ></#list     
 ></#if
 ><#assign val="" 
 ><#if f701?exists               
      ><#list f701 as field 
           ><#assign allSF="ab"     
           ><@field700 field/><#--
           --><@toUpperFirst/><#-- 
           --><#if val!=""
           		><#if aut!=""
           			><#assign aut=aut+"<BR>"
           		></#if	
           		><#assign aut=aut+val
           ></#if		
           
      ></#list     
 ></#if
 
></#macro   

><#macro autor1
 ><#assign val=""
 ><#assign aut=""
 ><#if f700?exists               
      ><#list f700 as field 
           ><#assign allSF="ab"     
           ><@field700 field/><#-- 
           --><@toUpperFirst/><#--
           --><#assign aut=val
           ><#break
      ></#list     
 ></#if 
></#macro   


><#macro napomene1
><#assign nap1=""
><#assign firstNap=true
      ><#if f300?exists
               ><#list f300 as field
                       ><#assign val=""                        
                       ><#assign allSF="a" 
                       ><@field300 field/><#--       
                       --><#if val!=""
                                   ><#assign firstNap=false
                                   ><#if nap1!=""
                                            ><#if nap1?ends_with(".")
                                                       ><#assign nap1=nap1+"&nbsp;-&nbsp;" 
                                            ><#else
                                                       ><#assign nap1=nap1+".&nbsp;-&nbsp;" 
                                            ></#if                                                                               
                                  ></#if
                                  ><#assign nap1=nap1+val      
                     ></#if
              ></#list
     ></#if
   ><#assign firstNap1=true  
   ><#if f320?exists 
         ><#list f320 as field
                 ><#assign val=""                      
                 ><#assign allSF="a"     
                 ><@field200 field/><#--
                 --><#if val!=""
                          ><#if firstNap1 
                          		><#assign firstNap1=false
                          		><#if !firstNap 
                          			><#assign nap1=nap1+"<BR>"
                          		></#if	                        
                          ><#elseif nap1!=""
                                            ><#if nap1?ends_with(".")
                                                       ><#assign nap1=nap1+"&nbsp;-&nbsp;" 
                                            ><#else
                                                       ><#assign nap1=nap1+".&nbsp;-&nbsp;" 
                                            ></#if
                                  ><#else
                                            ><#assign nap1="<BR><BR>"                                             
                                  ></#if
                                  ><#assign nap1=nap1+val
                ></#if
        ></#list
  ></#if  
    
></#macro

><#macro isbnBroj
  ><#assign isb=""  
        ><#if f010?exists                 
                 ><#list f010 as field
                          ><#assign val=""
                          ><#assign allSF="a" 
                          ><@field010 field/><#--
                          --><#if val!=""                                   
                                   ><#assign isb=isb+val
                          ></#if
                          ><#break
                ></#list
     ></#if
     
></#macro   
><#macro naslov
 ><#assign nas=""
 
 ><#if f200?exists               
      ><#list f200 as field
           ><#assign val=""
           ><#assign allSF="a"     
           ><@field200 field/><#-- 
           --><#assign nas=val
           ><#break
      ></#list     
 ></#if   
  
></#macro
><#macro naslov2
 ><#assign nas2="" 
 ><#if f200?exists               
      ><#list f200 as field 
           ><#assign val=""
           ><#assign allSF="c"     
           ><@field200 field/><#-- 
           --><#assign nas2=val
           ><#break
      ></#list     
 ></#if   
  
></#macro
><#macro deoKnj
 ><#assign deo="" 
 ><#if f200?exists               
      ><#list f200 as field 
           ><#assign val=""
           ><#assign allSF="h"     
           ><@field200 field/><#-- 
           --><#assign deo=val
           ><#break
      ></#list     
 ></#if   
  
></#macro
><#macro naslovDeo
 ><#assign nasDeo=""
 
 ><#if f200?exists               
      ><#list f200 as field 
           ><#assign val=""
           ><#assign allSF="i"     
           ><@field200 field/><#-- 
           --><#assign nasDeo=val
           ><#break
      ></#list     
 ></#if   
  
></#macro
><#macro mesto
 ><#assign mes=""
 
 ><#if f210?exists               
      ><#list f210 as field 
           ><#assign val=""
           ><#assign allSF="a"     
           ><@field210 field/><#-- 
           --><#assign mes=val
           ><#break
      ></#list     
 ></#if   
  
></#macro

><#macro brStr
 ><#assign brS=""
 
 ><#if f215?exists               
      ><#list f215 as field 
           ><#assign val=""
           ><#assign allSF="a"     
           ><@field215 field/><#-- 
           --><#assign brS=val
           ><#break
      ></#list     
 ></#if   
  
></#macro

><#macro dimenzije
 ><#assign dim=""
 
 ><#if f215?exists               
      ><#list f215 as field 
           ><#assign val=""
           ><#assign allSF="d"     
           ><@field215 field/><#-- 
           --><#assign dim=val
           ><#break
      ></#list     
 ></#if   
  
></#macro

><#macro zbirka
 ><#assign zbir=""
 
 ><#if f225?exists               
      ><#list f225 as field 
           ><#assign val=""
           ><#assign allSF="a"     
           ><@field225 field/><#-- 
           --><#assign zbir=val
           ><#break
      ></#list     
 ></#if   
  
></#macro

><#macro izdavac
 
 ><#if f210?exists               
      ><#list f210 as field 
           ><#assign allSF="c" 
           ><#assign val=""    
           ><@field210 field/><#-- 
           --><#break
      ></#list     
 ></#if  
 ><#assign open=-1
 ><#list val?split("(") as x
        ><#assign open=open+1
 ></#list  
 ><#assign close=-1
 ><#list val?split(")") as x
        ><#assign close=close+1
 ></#list  
 ><#if (open>close)
  ><#assign val=val+")"
 ></#if
 ><#assign izd=val
></#macro 
><#macro godIzd
 
 ><#if f210?exists               
      ><#list f210 as field 
           ><#assign allSF="d" 
           ><#assign val=""    
           ><@field210 field/><#-- 
           --><#break
      ></#list     
 ></#if 
 ><#assign open=-1
 ><#list val?split("(") as x
        ><#assign open=open+1
 ></#list  
 ><#assign close=-1
 ><#list val?split(")") as x
        ><#assign close=close+1
 ></#list  
 ><#if (open>close)
  ><#assign val=val+")"
 ></#if
 ><#assign god=val
></#macro

><#macro UDC
   ><#assign udc=""
   ><#if f675?exists               
      ><#list f675 as field 
           ><#assign val=""
           ><#assign allSF="a"     
           ><@field010 field/><#-- 
           --><#if val!=""
               ><#if udc!=""
                  ><#assign udc=udc+"<BR>"
               ></#if
               ><#assign udc=udc+val
           ></#if       
      ></#list     
  ></#if 
></#macro  

>