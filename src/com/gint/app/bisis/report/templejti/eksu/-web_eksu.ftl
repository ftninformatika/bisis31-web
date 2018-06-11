<#include "_base_eksu.ftl"

><@autor/><@naslov/><@naslov2/><@deoKnj/><@naslovDeo/><@mesto/><@izdavac/><@godIzd/><@brStr/><@dimenzije/><@zbirka/><@napomene1/><@isbnBroj/><@UDC/><@signatura/><@invbrojevi/><#--


  
--><#assign web=""

><#assign web=web+"<TABLE cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">"

><#if aut!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+autorR+":</i></TD><TD>"+aut+"</TD></TR>"
></#if 
><#if aut!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><BR></TD><TD></TD></TR>"
></#if
><#if nas!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+naslovR+":</i></TD><TD>"+nas+"</TD></TR>"
></#if
><#if nas2!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+naslovDrugogR+":</i></TD><TD>"+nas2+"</TD></TR>"
></#if
><#if deo!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+deoR+":</i></TD><TD>"+deo+"</TD></TR>"
></#if
><#if nasDeo!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+naslovDelaR+":</i></TD><TD>"+nasDeo+"</TD></TR>"
></#if
><#if nas!="" || nas2!="" || deo!="" || nasDeo!="" 
   ><#assign web=web+"<TR><TD><BR></TD><TD></TD></TR>"
></#if
><#if mes!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+mestoR+":</i></TD><TD>"+mes+"</TD></TR>"
></#if
><#if izd!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+izdavacR+":</i></TD><TD>"+izd+"</TD></TR>"
></#if
><#if god!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+godIzdR+":</i></TD><TD>"+god+"</TD></TR>"
></#if
><#if brS!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+brStrR+":</i></TD><TD>"+brS+"</TD></TR>"
></#if
><#if dim!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+dimenzijeR+":</i></TD><TD>"+dim+"</TD></TR>"
></#if
><#if zbir!=""
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+zbirkaR+":</i></TD><TD>"+zbir+"</TD></TR>"
></#if
><#if mes!="" || izd!="" || god!="" || brS!="" || dim!="" || zbir!=""
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><BR></TD><TD></TD></TR>"
></#if
><#if nap1!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+napomeneR+":</i></TD><TD>"+nap1+"</TD></TR>"
></#if
><#if isb!="" 
   ><#assign web=web+"<TR><TD valign=top><i>ISBN:</i></TD><TD>"+isb+"</TD></TR>"
></#if
><#if udc!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+udkR+":</i></TD><TD>"+udc+"</TD></TR>"
></#if
><#if nap1!="" || isb!="" || udc!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><BR></TD><TD></TD></TR>"
></#if
><#if sign!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+signat+":</i></TD><TD valign=bottom>"+sign+"</TD></TR>"
></#if
><#if sign!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><BR></TD><TD></TD></TR>"
></#if
><#if invbr!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><i>"+invbrojR+":</i></TD><TD valign=bottom>"+invbr+"</TD></TR>"
></#if
><#if invbr!="" 
   ><#assign web=web+"<TR><TD valign=top width=\"18%\"><BR></TD><TD></TD></TR>"
></#if
><#assign web=web+"</TABLE>"
>${web}  