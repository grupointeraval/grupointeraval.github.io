library(readxl)
operacionesdiarias <- read_excel("operacionesdiarias.xlsx", 
                                 col_types = c("date", "text", "text", 
                                               "numeric", "numeric", "numeric"))

tipodecambio <- read_excel("operacionesdiarias.xlsx", 
                           sheet = "TIPO DE CAMBIO", col_types = c("date", 
                                                                   "numeric"))

operacionesdiarias_bnc=operacionesdiarias[operacionesdiarias$Título=="BNC",]

j=1
for (i in 1:nrow(operacionesdiarias_bnc)) 

    
{
  
if (tipodecambio$FECHA[i]==operacionesdiarias_bnc$Vencimiento[j])
  {
  j=j+1
  
  operacionesdiarias_bnc[i,7]=operacionesdiarias_bnc$Total[i]/tipodecambio$FECHA[i]
  
  }
  
}
