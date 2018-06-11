<#include "_polja_eksu.ftl"
><#macro cutFirstN  
 ><#assign i=1
 ><#assign pom=" "
 ><#list val?split(" ") as x
        ><#if i!=1
             ><#assign pom=pom+" "
        ></#if
        ><#assign pom=pom+x
        
             ><#if i==number+1
                  ><#break
             ></#if
             ><#assign i=i+1
 ></#list
 ><#assign val=pom
></#macro
><#macro upperFirstN 
 ><#assign i=0
 ><#assign pom=""
 

 ><#if (val?index_of("&nbsp;")!=-1 && val?index_of(" ")=-1 )|| (val?index_of("&nbsp;")!=-1 && (val?index_of("&nbsp;")<val?index_of(" ")))
           ><#list val?split("&nbsp;") as x
                 ><#if i!=0
                      ><#assign pom=pom+"&nbsp;"
                 ></#if
                 ><#if i<number
                     ><#assign pom=pom+x?upper_case
                     ><#assign i=i+1
                 ><#else
                     ><#assign pom=pom+x
                 ></#if 
         ></#list

 ><#elseif val?index_of(" ")!=-1
         ><#list val?split(" ") as x
                ><#if i!=0
                    ><#assign pom=pom+"&nbsp;"
                ></#if
                ><#if i<number
                     ><#assign pom=pom+x?upper_case
                     ><#assign i=i+1
                ><#else
                     ><#assign pom=pom+x
                ></#if 
         ></#list
 ><#else
      ><#assign pom=val
 ></#if
 ><#assign val=pom
></#macro
><#macro toUpperFirst 
 ><#assign pom=""
 ><#if val?index_of(",")!=-1
       ><#assign pom=""
       ><#assign i=1
       ><#list val?split(",") as x
              
              ><#if i=1
                   ><#assign i=2
                   ><#assign pom=pom+ x?upper_case 
             ><#else 
                   ><#assign pom=pom+","+x
             ></#if
       ></#list
 
 ><#elseif (val?index_of("&nbsp;")!=-1 && val?index_of(" ")=-1 )|| (val?index_of("&nbsp;")!=-1 && (val?index_of("&nbsp;")<val?index_of(" ")))

       ><#assign pom=""
       ><#assign i=1
       ><#list val?split("&nbsp;") as x
                ><#if i=1
                        ><#assign i=2
                        ><#assign pom=pom+ x?upper_case 
                ><#else 
                        ><#assign pom=pom+"&nbsp;"+ x
                ></#if
      ></#list 
 ><#elseif val?index_of(" ")!=-1
       ><#assign pom=""
       ><#assign i=1
       ><#list val?split(" ") as x
                ><#if i=1
                        ><#assign i=2
                        ><#assign pom=pom+ x?upper_case 
                ><#else 
                        ><#assign pom=pom+"&nbsp;"+ x
                ></#if
      ></#list
 ><#else
     ><#assign pom=val
 
 ></#if
      ><#assign val=pom
></#macro
><#macro cutAndUpper  
 ><#assign i=1
 ><#assign pom=""
 ><#if val?index_of(" ")!=-1
 ><#list val?split(" ") as x
        ><#if i=1
               ><#assign pom=pom+x?upper_case
        ><#elseif i!=1 && i<=3
             ><#assign pom=pom+"&nbsp;"+x
        ><#elseif i=4
             ><#assign pom=pom+"..."
             ><#break
        ></#if  
        ><#assign i=i+1
 ></#list
 ><#assign val=pom
 ></#if
></#macro
>