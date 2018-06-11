<#include "_koncept_gbsa.ftl"


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
><#macro odrediBrojSigli
   ><#assign free=false
   ><#list inventarStatus.invList as help
       ><#if help.invNum=inventar
         ><#if help.status="0"
          ><#assign free=true
         ></#if 
         ><#break
       ></#if
   ></#list      
   ><#if sigla?starts_with("00")
      ><#if free
         ><#assign s0F=s0F+1
      ></#if   
      ><#assign s0=s0+1
   ><#elseif sigla?starts_with("01")
      ><#if free
         ><#assign s1F=s1F+1
      ></#if    
      ><#assign s1=s1+1
   ><#elseif sigla?starts_with("02")
      ><#if free
         ><#assign s2F=s2F+1
      ></#if   
      ><#assign s2=s2+1 
   ><#elseif sigla?starts_with("03")
      ><#if free
         ><#assign s3F=s3F+1
      ></#if
      ><#assign s3=s3+1 
   ><#elseif sigla?starts_with("04")
      ><#if free
         ><#assign s4F=s4F+1
      ></#if   
      ><#assign s4=s4+1 
   ><#elseif sigla?starts_with("05")
      ><#if free
         ><#assign s5F=s5F+1
      ></#if   
      ><#assign s5=s5+1 
   ><#elseif sigla?starts_with("06")
      ><#if free
         ><#assign s6F=s6F+1
      ></#if   
      ><#assign s6=s6+1
   ><#elseif sigla?starts_with("07")
      ><#if free
         ><#assign s7F=s7F+1
      ></#if   
      ><#assign s7=s7+1  
   ><#elseif sigla?starts_with("08")
      ><#if free
         ><#assign s8F=s8F+1
      ></#if   
      ><#assign s8=s8+1  
   ><#elseif sigla?starts_with("09")
      ><#if free
         ><#assign s9F=s9F+1
      ></#if   
      ><#assign s9=s9+1 
   ><#elseif sigla?starts_with("10")
      ><#if free
         ><#assign s10F=s10F+1
      ></#if   
      ><#assign s10=s10+1
   ><#elseif sigla?starts_with("11")
      ><#if free
         ><#assign s11F=s11F+1
      ></#if   
      ><#assign s11=s11+1
   ><#elseif sigla?starts_with("12")
      ><#if free
         ><#assign s12F=s12F+1
      ></#if   
      ><#assign s12=s12+1 
   ><#elseif sigla?starts_with("13")
      ><#if free
         ><#assign s13F=s13F+1
      ></#if   
      ><#assign s13=s13+1 
   ><#elseif sigla?starts_with("14")
      ><#if free
         ><#assign s14F=s14F+1
      ></#if   
      ><#assign s14=s14+1 
   ><#elseif sigla?starts_with("15")
      ><#if free
         ><#assign s15F=s15F+1
      ></#if   
      ><#assign s15=s15+1 
   ><#elseif sigla?starts_with("16")
      ><#if free
         ><#assign s16F=s16F+1
      ></#if   
      ><#assign s16=s16+1
   ><#elseif sigla?starts_with("17")
      ><#if free
         ><#assign s17F=s17F+1
      ></#if   
      ><#assign s17=s17+1  
   ><#elseif sigla?starts_with("18")
      ><#if free
         ><#assign s18F=s18F+1
      ></#if   
      ><#assign s18=s18+1  
   ><#elseif sigla?starts_with("19")
      ><#if free
         ><#assign s19F=s19F+1
      ></#if   
      ><#assign s19=s19+1   
   ><#elseif sigla?starts_with("20")
      ><#if free
         ><#assign s20F=s20F+1
      ></#if   
      ><#assign s20=s20+1
   ><#elseif sigla?starts_with("21")
      ><#if free
         ><#assign s21F=s21F+1
      ></#if 
      ><#assign s21=s21+1
   ><#elseif sigla?starts_with("22")
      ><#if free
         ><#assign s22F=s22F+1
      ></#if 
      ><#assign s22=s22+1 
   ><#elseif sigla?starts_with("23")
      ><#if free
         ><#assign s23F=s23F+1
      ></#if 
      ><#assign s23=s23+1 
   ><#elseif sigla?starts_with("24")
      ><#if free
         ><#assign s24F=s24F+1
      ></#if 
      ><#assign s24=s24+1 
   ><#elseif sigla?starts_with("25")
      ><#if free
         ><#assign s25F=s25F+1
      ></#if 
      ><#assign s25=s25+1 
   ><#elseif sigla?starts_with("26")
      ><#if free
         ><#assign s26F=s26F+1
      ></#if 
      ><#assign s26=s26+1
   ><#elseif sigla?starts_with("27")
      ><#if free
         ><#assign s27F=s27F+1
      ></#if 
      ><#assign s27=s27+1  
   ><#elseif sigla?starts_with("28")
      ><#if free
         ><#assign s28F=s28F+1
      ></#if 
      ><#assign s28=s28+1  
   ><#elseif sigla?starts_with("29")
      ><#if free
         ><#assign s29F=s29F+1
      ></#if 
      ><#assign s29=s29+1  
   ><#elseif sigla?starts_with("30")
      ><#if free
         ><#assign s30F=s30F+1
      ></#if 
      ><#assign s30=s30+1
   ><#elseif sigla?starts_with("31")
      ><#if free
         ><#assign s31F=s31F+1
      ></#if 
      ><#assign s31=s31+1
   ><#elseif sigla?starts_with("32")
      ><#if free
         ><#assign s32F=s32F+1
      ></#if 
      ><#assign s32=s32+1 
   ><#elseif sigla?starts_with("33")
      ><#if free
         ><#assign s33F=s33F+1
      ></#if 
      ><#assign s33=s33+1 
   ><#else 
      ><#if free
         ><#assign s34F=s34F+1
      ></#if 
      ><#assign s34=s34+1 
   ></#if   
           
></#macro           
      
        
      
><#macro inventarni
 ><#assign s0=0 
 ><#assign s1=0
 ><#assign s2=0
 ><#assign s3=0
 ><#assign s4=0
 ><#assign s5=0
 ><#assign s6=0
 ><#assign s7=0
 ><#assign s8=0
 ><#assign s9=0
 ><#assign s10=0
 ><#assign s11=0
 ><#assign s12=0
 ><#assign s13=0
 ><#assign s14=0
 ><#assign s15=0
 ><#assign s16=0
 ><#assign s17=0
 ><#assign s18=0
 ><#assign s19=0
 ><#assign s20=0
 ><#assign s21=0
 ><#assign s22=0
 ><#assign s23=0
 ><#assign s24=0
 ><#assign s25=0
 ><#assign s26=0
 ><#assign s27=0
 ><#assign s28=0
 ><#assign s29=0
 ><#assign s30=0
 ><#assign s31=0
 ><#assign s32=0
 ><#assign s33=0
 ><#assign s34=0
 
 ><#assign s0F=0 
 ><#assign s1F=0
 ><#assign s2F=0
 ><#assign s3F=0
 ><#assign s4F=0
 ><#assign s5F=0
 ><#assign s6F=0
 ><#assign s7F=0
 ><#assign s8F=0
 ><#assign s9F=0
 ><#assign s10F=0
 ><#assign s11F=0
 ><#assign s12F=0
 ><#assign s13F=0
 ><#assign s14F=0
 ><#assign s15F=0
 ><#assign s16F=0
 ><#assign s17F=0
 ><#assign s18F=0
 ><#assign s19F=0
 ><#assign s20F=0
 ><#assign s21F=0
 ><#assign s22F=0
 ><#assign s23F=0
 ><#assign s24F=0
 ><#assign s25F=0
 ><#assign s26F=0
 ><#assign s27F=0
 ><#assign s28F=0
 ><#assign s29F=0
 ><#assign s30F=0
 ><#assign s31F=0
 ><#assign s32F=0
 ><#assign s33F=0
 ><#assign s34F=0
 ><#assign inv=""
 ><#assign sigle=""  
 
 ><#if f996?exists               
      ><#list f996 as field 
           ><#assign val=""
           ><#assign allSF="f"     
           ><@field996 field/><#--            
           --><#assign inventar=val
           
           ><#if inventar!=""
               ><#assign val=""
               ><#assign allSF="w"     
               ><@field996 field/><#--            
              --><#assign sigla=val
              ><#if sigla!=""               
               
                  ><@odrediBrojSigli/><#--
              --></#if  
           ></#if  
      ></#list     
 ></#if  

    ><#assign sigle=""
    ><#if s0!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"0"
       ><#if s0F!=0
          ><#assign sigle=sigle+"-"+s0F?string
       ></#if   
    ></#if 
    ><#if s1!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"1"
       ><#if s1F!=0
          ><#assign sigle=sigle+"-"+s1F?string
       ></#if
    ></#if 
    ><#if s2!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"2"
       ><#if s2F!=0
          ><#assign sigle=sigle+"-"+s2F?string
       ></#if
    ></#if 
    ><#if s3!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"3"
       ><#if s3F!=0
          ><#assign sigle=sigle+"-"+s3F?string
       ></#if
    ></#if 
    ><#if s4!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"4"
       ><#if s4F!=0
          ><#assign sigle=sigle+"-"+s4F?string
       ></#if
    ></#if 
    ><#if s5!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"5"
       ><#if s5F!=0
          ><#assign sigle=sigle+"-"+s5F?string
       ></#if
    ></#if 
    ><#if s6!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"6"
       ><#if s6F!=0
          ><#assign sigle=sigle+"-"+s6F?string
       ></#if
    ></#if 
    ><#if s7!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"7"
       ><#if s7F!=0
          ><#assign sigle=sigle+"-"+s7F?string
       ></#if
    ></#if 
    ><#if s8!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"8"
       ><#if s8F!=0
          ><#assign sigle=sigle+"-"+s8F?string
       ></#if
    ></#if 
    ><#if s9!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"9"
       ><#if s9F!=0
          ><#assign sigle=sigle+"-"+s9F?string
       ></#if
    ></#if 
    ><#if s10!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"10"
       ><#if s10F!=0
          ><#assign sigle=sigle+"-"+s10F?string
       ></#if
    ></#if 
    ><#if s11!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"11"
       ><#if s11F!=0
          ><#assign sigle=sigle+"-"+s11F?string
       ></#if
    ></#if 
    ><#if s12!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"12"
       ><#if s12F!=0
          ><#assign sigle=sigle+"-"+s12F?string
       ></#if
    ></#if 
    ><#if s13!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"13"
       ><#if s13F!=0
          ><#assign sigle=sigle+"-"+s13F?string
       ></#if
    ></#if 
    ><#if s14!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"14"
       ><#if s14F!=0
          ><#assign sigle=sigle+"-"+s14F?string
       ></#if
    ></#if 
    ><#if s15!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"15"
       ><#if s15F!=0
          ><#assign sigle=sigle+"-"+s15F?string
       ></#if
    ></#if 
    ><#if s16!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"16"
       ><#if s16F!=0
          ><#assign sigle=sigle+"-"+s16F?string
       ></#if
    ></#if 
    ><#if s17!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"17"
       ><#if s17F!=0
          ><#assign sigle=sigle+"-"+s17F?string
       ></#if
    ></#if 
    ><#if s18!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"18"
       ><#if s18F!=0
          ><#assign sigle=sigle+"-"+s18F?string
       ></#if
    ></#if 
    ><#if s19!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"19"
       ><#if s19F!=0
          ><#assign sigle=sigle+"-"+s19F?string
       ></#if
    ></#if 
    ><#if s20!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"20"
       ><#if s20F!=0
          ><#assign sigle=sigle+"-"+s20F?string
       ></#if
    ></#if 
    ><#if s21!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"21"
       ><#if s21F!=0
          ><#assign sigle=sigle+"-"+s21F?string
       ></#if
    ></#if 
    ><#if s22!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"22"
       ><#if s22F!=0
          ><#assign sigle=sigle+"-"+s22F?string
       ></#if
    ></#if 
    ><#if s23!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"23"
       ><#if s23F!=0
          ><#assign sigle=sigle+"-"+s23F?string
       ></#if
    ></#if 
    ><#if s24!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"24"
       ><#if s24F!=0
          ><#assign sigle=sigle+"-"+s24F?string
       ></#if
    ></#if 
    ><#if s25!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"25"
       ><#if s25F!=0
          ><#assign sigle=sigle+"-"+s25F?string
       ></#if
    ></#if 
    ><#if s26!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"26"
       ><#if s26F!=0
          ><#assign sigle=sigle+"-"+s26F?string
       ></#if
    ></#if 
    ><#if s27!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"27"
       ><#if s27F!=0
          ><#assign sigle=sigle+"-"+s27F?string
       ></#if
    ></#if 
    ><#if s28!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"28"
       ><#if s28F!=0
          ><#assign sigle=sigle+"-"+s28F?string
       ></#if
    ></#if 
    ><#if s29!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"29"
       ><#if s29F!=0
          ><#assign sigle=sigle+"-"+s29F?string
       ></#if
    ></#if 
    ><#if s30!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"30"
       ><#if s30F!=0
          ><#assign sigle=sigle+"-"+s30F?string
       ></#if
    ></#if 
    ><#if s31!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"31"
       ><#if s31F!=0
          ><#assign sigle=sigle+"-"+s31F?string
       ></#if
    ></#if 
    ><#if s32!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"32"
       ><#if s32F!=0
          ><#assign sigle=sigle+"-"+s32F?string
       ></#if
    ></#if 
    ><#if s33!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"33"
       ><#if s33F!=0
          ><#assign sigle=sigle+"-"+s33F?string
       ></#if
    ></#if 
    ><#if s34!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"34"
       ><#if s34F!=0
          ><#assign sigle=sigle+"-"+s34F?string
       ></#if
    ></#if    
    
  
 
   ><#assign inv=inv+sigle 
   
></#macro
>