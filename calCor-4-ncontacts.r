######################################
# initialization
######################################
source("./palnel.R")
normalized <- FALSE
# ususally not normal distribution, recommend to use spearman
nors <- c("spearman", "pearson")
mets <- c("complete", "average")
sel_s <- 1e5
RData_f <- ".RData"
color_leaf <- FALSE

colLab = function(n){
  if(is.leaf(n)){
    a = attributes(n)
    color = color.lookup$color[which(color.lookup$leaf.name==a$label)[1]]
    lab.color = color
    cex.val = 1
    attr(n, "nodePar") <- c(a$nodePar, list(lab.col = lab.color, lab.cex=cex.val))
  }
  n
}

######################################
# parse inputs
######################################
fileName <- commandArgs()
if (length(fileName) != 7){
 print("# calculate the correlation of .n_contact directly by list of contacts")
 print("USAGE: calCor-4-ncontacts.R list.n_contact output_prefix, n_contact should be in the same resolution\n")
 quit()
}

output_prefix <- as.character(fileName[length(fileName)])

######################################
# read input
######################################
if(file.exists(RData_f)){
  load(RData_f)
}else{
  d <- read.table(fileName[length(fileName) - 1])
  names <- as.character(d[, 1])
  files <- as.character(d[, 2])
  if(ncol(d) == 3){
    colData <- data.frame(conds=factor(d[, 3]))
    cond2cols <- as.list(grDevices::rainbow(nlevels(colData$conds), s = 1, v = 0.7))
    names(cond2cols) <- levels(colData$conds)
    lookupValue <- cond2cols[colData$conds]
    color.lookup <- data.frame(leaf.name = names, color = unlist(lookupValue), stringsAsFactors = F)
    assign("color.lookup", color.lookup, envir = .GlobalEnv)
    color_leaf <- TRUE
  }
  
  num_files <- length(files)
  print(paste("# of files=", num_files))
  
  res_m <- c()
  res_obs <- c()
  for(i in c(1:num_files)){
    print(paste("reading",files[i]))
    c <- read.table(files[i], header = FALSE)
    colnames(c) <- c("cbin1", "cbin2", "nor")
    
    # exclude bin1 = bin2
    c <- c[c$cbin1<c$cbin2,]
    
    #  make index by cbin1 & cbin2
    c$index <- paste(c$cbin1, c$cbin2, sep = ".")
    
    c <- c[!is.infinite(c$nor), ]
    colnames(c)[3] <- names[i]
    
    if(is.null(res_m)){
      res_m <- c[, c("index", names[i])]
    }
    else{
      res_m <- merge(res_m, c[,c("index", names[i])], by.x = "index", by.y = "index", all = FALSE) 
    }
  }
  
  #remove index
  res_clean <- res_m[, -1]
  # remove NaN
  res_clean <- res_clean[complete.cases(res_clean), ]
}

# plot correlation of data
plot_f <- paste("./pngs/corrPlot", output_prefix, sep = "_")  
plot_f <- paste(plot_f, "png", sep = ".")
png(plot_f, width = 2048, height = 2048)
pairs(res_clean, lower.panel = panel.smooth, upper.panel = panel.cor, diag.panel = panel.hist)
dev.off()

# main
for(nor in nors){
  # save correlation into table  
  table_f <- paste("./tsvs/corDist", output_prefix, nor, sep = "_") 
  table_f <- paste(table_f, "tsv", sep = ".")
  corr <- cor(res_clean, method = nor)
  distance <- as.dist(1-abs(corr))
  write.table(corr, table_f, quote = F, sep = "\t")

  # plot cluster of dats
  for(met in mets){
    cluster_f <- paste("./pngs/cluster", output_prefix, nor, met, sep="_")
    cluster_f <- paste(cluster_f, "png", sep = ".")
    hc <- hclust(distance, method = met)
    png(cluster_f, width = 1024, height = 512)
    if(color_leaf){    
      dhc <- as.dendrogram(hc)
      dL  <- dendrapply(dhc, colLab)
      plot(dL)
    }
    else{
      plot(hc)    
    }
    dev.off()    
  }
}

quit()
