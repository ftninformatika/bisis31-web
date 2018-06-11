<#include "_koncept_gbns.ftl"
><#macro signatura
 ><#assign sign=""
 ><#assign old=""
 ><#if f996?exists               
      ><#list f996 as field 
           ><#assign val=""
           ><#assign allSF="d"     
           ><@field996 field/><#-- 
           --><#if val!="" && old!=val
                 ><#assign old=val
                 ><#if sign!=""
                    ><#assign sign=sign+"<BR>"
                 ></#if   
                 ><#assign sign=sign+val
          ></#if       
      ></#list     
 ></#if  
 
></#macro
><#macro odrediBrojSigli
   ><#if sigla?starts_with("00")
      ><#assign s0=s0+1
   ><#elseif sigla?starts_with("01")
      ><#assign s1=s1+1
   ><#elseif sigla?starts_with("02")
      ><#assign s2=s2+1 
   ><#elseif sigla?starts_with("03")
      ><#assign s3=s3+1 
   ><#elseif sigla?starts_with("04")
      ><#assign s4=s4+1 
   ><#elseif sigla?starts_with("05")
      ><#assign s5=s5+1 
   ><#elseif sigla?starts_with("06")
      ><#assign s6=s6+1
   ><#elseif sigla?starts_with("07")
      ><#assign s7=s7+1  
   ><#elseif sigla?starts_with("08")
      ><#assign s8=s8+1  
   ><#elseif sigla?starts_with("09")
      ><#assign s9=s9+1 
   ><#elseif sigla?starts_with("10")
      ><#assign s10=s10+1
   ><#elseif sigla?starts_with("11")
      ><#assign s11=s11+1
   ><#elseif sigla?starts_with("12")
      ><#assign s12=s12+1 
   ><#elseif sigla?starts_with("13")
      ><#assign s13=s13+1 
   ><#elseif sigla?starts_with("14")
      ><#assign s14=s14+1 
   ><#elseif sigla?starts_with("15")
      ><#assign s15=s15+1 
   ><#elseif sigla?starts_with("16")
      ><#assign s16=s16+1
   ><#elseif sigla?starts_with("17")
      ><#assign s17=s17+1  
   ><#elseif sigla?starts_with("18")
      ><#assign s18=s18+1  
   ><#elseif sigla?starts_with("19")
      ><#assign s19=s19+1   
   ><#elseif sigla?starts_with("20")
      ><#assign s20=s20+1
   ><#elseif sigla?starts_with("21")
      ><#assign s21=s21+1
   ><#elseif sigla?starts_with("22")
      ><#assign s22=s22+1 
   ><#elseif sigla?starts_with("23")
      ><#assign s23=s23+1 
   ><#elseif sigla?starts_with("24")
      ><#assign s24=s24+1 
   ><#elseif sigla?starts_with("25")
      ><#assign s25=s25+1 
   ><#elseif sigla?starts_with("26")
      ><#assign s26=s26+1
   ><#elseif sigla?starts_with("27")
      ><#assign s27=s27+1  
   ><#elseif sigla?starts_with("28")
      ><#assign s28=s28+1  
   ><#elseif sigla?starts_with("29")
      ><#assign s29=s29+1  
   ><#elseif sigla?starts_with("30")
      ><#assign s10=s10+1
   ><#elseif sigla?starts_with("31")
      ><#assign s31=s31+1
   ><#elseif sigla?starts_with("32")
      ><#assign s32=s32+1 
   ><#elseif sigla?starts_with("33")
      ><#assign s33=s33+1 
   ><#else 
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
 ><#assign inv=""
 ><#assign sigle=""  
 
 ><#if f996?exists               
      ><#list f996 as field 
           ><#assign val=""
           ><#assign allSF="f"     
           ><@field996 field/><#--            
           --><#assign inventar=val
           ><#if inv!=""
             ><#assign inv=inv+",&nbsp;"
           ></#if  
           ><#assign inv=inv+val 
           ><#if inventar!=""
               ><#assign val=""
               ><#assign allSF="w"     
               ><@field996 field/><#--            
              --><#assign sigla=val
              ><#if sigla=""
                 ><#assign sigla=inventar
              ></#if   
              ><@odrediBrojSigli/><#--
          --></#if  
      ></#list     
 ></#if  
 ><#if inv!=""
    ><#assign sigle=""
    ><#if s0!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"0-"+s0?string
    ></#if 
    ><#if s1!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"1-"+s1?string
    ></#if 
    ><#if s2!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"2-"+s2?string
    ></#if 
    ><#if s3!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"3-"+s3?string
    ></#if 
    ><#if s4!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"4-"+s4?string
    ></#if 
    ><#if s5!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"5-"+s5?string
    ></#if 
    ><#if s6!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"6-"+s6?string
    ></#if 
    ><#if s7!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"7-"+s7?string
    ></#if 
    ><#if s8!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"8-"+s8?string
    ></#if 
    ><#if s9!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"9-"+s9?string
    ></#if 
    ><#if s10!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"10-"+s10?string
    ></#if 
    ><#if s11!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"11-"+s11?string
    ></#if 
    ><#if s12!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"12-"+s12?string
    ></#if 
    ><#if s13!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"13-"+s13?string
    ></#if 
    ><#if s14!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"14-"+s14?string
    ></#if 
    ><#if s15!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"15-"+s15?string
    ></#if 
    ><#if s16!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"16-"+s16?string
    ></#if 
    ><#if s17!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"17-"+s17?string
    ></#if 
    ><#if s18!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"18-"+s18?string
    ></#if 
    ><#if s19!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"19-"+s19?string
    ></#if 
    ><#if s20!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"20-"+s20?string
    ></#if 
    ><#if s21!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"21-"+s21?string
    ></#if 
    ><#if s22!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"22-"+s22?string
    ></#if 
    ><#if s23!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"23-"+s23?string
    ></#if 
    ><#if s24!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"24-"+s24?string
    ></#if 
    ><#if s25!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"25-"+s25?string
    ></#if 
    ><#if s26!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"26-"+s26?string
    ></#if 
    ><#if s27!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"27-"+s27?string
    ></#if 
    ><#if s28!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"28-"+s28?string
    ></#if 
    ><#if s29!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"29-"+s29?string
    ></#if 
    ><#if s30!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"30-"+s30?string
    ></#if 
    ><#if s31!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"31-"+s31?string
    ></#if 
    ><#if s32!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"32-"+s32?string
    ></#if 
    ><#if s33!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"33-"+s33?string
    ></#if 
    ><#if s34!=0
       ><#if sigle!=""
           ><#assign sigle=sigle+",&nbsp;"
       ></#if    
       ><#assign sigle=sigle+"34-"+s34?string
    ></#if    
    
 ></#if   
 
   ><#assign inv=inv+"<BR>"+sigle+"<BR>" 
   
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