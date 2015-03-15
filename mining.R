create.transactions = function (data){
  
  trans = ""
  
  for(i in ncol(data)){
    is.text = nlevels(data[[i]]) > 2
    t = ""
    for(j in nrow(data)){
      tmp = t
      if(is.text){
        t = paste(tmp,data[j,i], sep=",")
      }else{
        t = paste(tmp,names(data[i]), sep=",")
      }
    }
    
    tmp = trans
    trans = paste(tmp, t, sep ="\n")
  }
  
  trans
}