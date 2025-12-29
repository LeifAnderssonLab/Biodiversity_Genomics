#require(GenomicRanges)
require(matrixStats)



## You can start here with the previously attached file
high_variance_freq <- read.table("UNION_vs_BIS_CAT_GAL_IRE_NOSE_SCO_STLA.Tot130inds.only_freqs.unknown.Zeros.incl93.fixCHRnames.FILT.no.SNPs.37bp.forMatsscript.bed", stringsAsFactors=F, header = T)

## The column names need to be re-added somehow, I use the lingering data frame from the last input file.
names(high_variance_freq) <- names(high_var_pool)

## Ordering is not strictly necessary, but looks nice 
high_variance_freq <- high_variance_freq[order(as.numeric(sub("seq_[sc]_", "", high_variance_freq[,1])), high_variance_freq[,2]),]

##save(high_variance_freq, file = "/proj/snic2020-2-19/private/herring/users/mats/SNP_selection/krill/joint_high_variance_SNPs.Rdata")
## You may use save() & load() to bypass the steps above, but it's not much faster than starting with the joint .gz-file.

## This is the actual design step.
#tSNPs <- stepwise_select(SNP_freq_df = high_variance_freq, target_pops = 3:dim(high_variance_freq)[2], n_steps = 30, n_iter = 1000, n_snps = 500, hm_file = "/proj/snic2020-2-19/private/herring/users/mats/SNP_selection/krill/SNP_selection_test2_krill_hm.pdf", scaffold_re = "seq_s_")
tSNPs <- stepwise_select(SNP_freq_df = high_variance_freq, target_pops = 3:dim(high_variance_freq)[2], n_steps = 20, n_iter = 100, n_snps =3000, hm_file = "SNP_selection_test__mackarel_3k_no_flankingSNPs_hm.pdf", scaffold_re = "NC_")

write.table(tSNPs$SNP_set$picked_SNPs, file = "selected_SNPs_mackarel_3k.noFlankingSNPs.txt", row.names = T, quote = F, sep = "\t")
## tSNPs$SNP_set$picked_SNPs is where the chosen SNPs end up, the rest of the data structure is mostly for tracking the selection process for debugging purposes

#Sanity-checking
#eval_mat <- as.matrix(tSNPs3$SNP_set$picked_SNPs[,-c(1,2)])
#colnames(eval_mat) <- names(tSNPs3$SNP_set$picked_SNPs[,-c(1,2)])
#rownames(eval_mat) <- paste(tSNPs3$SNP_set$picked_SNPs[,1], tSNPs3$SNP_set$picked_SNPs[,2], sep = "_")
#f1_eval <- Vectorize(FUN = function(X,Y, data_mat){sum(abs(data_mat[,X] - data_mat[,Y]))}, vectorize.args = c("X", "Y"))
#tmp_dist <- outer(FUN ="f1_eval", X=1:dim(eval_mat)[2], Y=1:dim(eval_mat)[2], data_mat = eval_mat)
#diag(tmp_dist) <- NA
#colnames(tmp_dist) <- colnames(eval_mat)
#rownames(tmp_dist) <- colnames(eval_mat)
#eval_cdm <- cmdscale(as.dist(tmp_dist))
#plot(eval_cdm, pch=19, cex=.5, xlab="MDS1", ylab="MDS2", bty='n', las=2)
#which(tmp_dist == min(tmp_dist, na.rm = T), arr.ind = T)

# tSNPs_mat <- as.matrix(tSNPs$picked_SNPs[,-c(1,2)])
# tmp_dist <- outer(FUN ="f1_eval", X=1:length(target_pops), Y=1:length(target_pops), data_mat = tSNPs_mat)
# diag(tmp_dist) <- NA
# min(tmp_dist, na.rm = T)

###


#Support functions
stepwise_select <- function(SNP_freq_df, n_steps, target_pops, n_snps = 20, n_iter = 1000, hm_file = NULL, scaffold_re){
  f3 <- Vectorize(FUN = function(X,Y, data_mat){sum(abs(data_mat[,X] - data_mat[,Y]))}, vectorize.args = c("X", "Y"))
  tSNPs_tmp <- select_SNPs(SNP_freq_df = SNP_freq_df, target_pops = target_pops,  n_iter = n_iter, n_snps = n_snps, , scaffold_re = scaffold_re)
  lSNPS <- numeric()
  lSNPS_list <-list()
  min_pair_list <- list()
  for(i in 1:(n_steps-1)){
    #lSNPS <- as.numeric(rownames(tSNPs_tmp$picked_SNPs)[order(rowSds(as.matrix(tSNPs_tmp$picked_SNPs[,-c(1,2)])), decreasing = T)][1:(i*10)])
    tSNPs_mat <- as.matrix(tSNPs_tmp$picked_SNPs[,-c(1,2)])
    tmp_dist <- outer(FUN ="f3", X=1:length(target_pops), Y=1:length(target_pops), data_mat = tSNPs_mat)
    diag(tmp_dist) <- NA
    min_pair <- which(tmp_dist == min(tmp_dist, na.rm = T), arr.ind = T)[1,]
    lSNPS_tmp <- as.numeric(rownames(tSNPs_tmp$picked_SNPs)[order(abs(tSNPs_mat[,min_pair[1]]-tSNPs_mat[,min_pair[2]]), decreasing = T)])
    lSNPS_tmp <- lSNPS_tmp[!(lSNPS_tmp %in% lSNPS)]
    lSNPS <- c(lSNPS, lSNPS_tmp[1:floor(n_snps/(n_steps))]) 
    if(i < (n_steps-1)) tSNPs_tmp <- select_SNPs(SNP_freq_df = SNP_freq_df, target_pops = target_pops,  n_iter = n_iter, n_snps = n_snps, locked_SNPs = lSNPS, scaffold_re = scaffold_re)
    if(i == (n_steps-1)) tSNPs_lock <- select_SNPs(SNP_freq_df = SNP_freq_df, target_pops = target_pops,  n_iter = n_iter, n_snps = n_snps, locked_SNPs = lSNPS, hm_file = hm_file, scaffold_re = scaffold_re)
    lSNPS_list[[i]] <- lSNPS
    min_pair_list[[i]] <- min_pair
  }
  return(list(SNP_set = tSNPs_lock, locked = lSNPS_list, min_pairs = min_pair_list))
}


select_SNPs <- function(SNP_freq_df, target_pops, n_snps = 20, n_iter = 100, locked_SNPs = NULL, hm_file = NULL, scaffold_re){
  tot_snps <- dim(SNP_freq_df)[1]
  SNP_mat <- as.matrix(SNP_freq_df[,-c(1,2)])
  colnames(SNP_mat) <- names(SNP_freq_df[,-c(1,2)])
  rownames(SNP_mat) <- paste(SNP_freq_df[,1], SNP_freq_df[,2], sep = "_")
  SNP_mat <- SNP_mat[,target_pops-2]
  if(is.null(locked_SNPs[1])) eval_mat <- sapply(X = rep(n_snps, times = n_iter), FUN = function(x){sample.int(tot_snps, x)})
  if(!is.null(locked_SNPs[1])){
    net_snps <- n_snps - length(locked_SNPs)
    sample_vec <- (1:tot_snps)[-locked_SNPs]
    eval_mat <- sapply(X = rep(net_snps, times = n_iter), FUN = function(x){c(locked_SNPs,sample_vec[sample.int(length(sample_vec),x)])})
  }
  
  f1 <- Vectorize(FUN = function(X,Y,Z){sum(abs(SNP_mat[eval_mat[,Z],X] - SNP_mat[eval_mat[,Z],Y]))}, vectorize.args = c("X","Y"))
  f2 = function(t_col){raw_dist <- outer(FUN ="f1", X=1:length(target_pops), Y=1:length(target_pops), Z = t_col); diag(raw_dist) <- NA;return(min(raw_dist, na.rm = T))}
  eval_vec <- sapply(1:n_iter, FUN = "f2")
  best_set <- min(which.max(eval_vec))
  picked_SNPs <- SNP_freq_df[eval_mat[,best_set], c(1,2,target_pops)]
  #picked_SNPs_chr <- picked_SNPs[grep(scaffold_re, picked_SNPs$CHROM),]
  picked_SNPs <- picked_SNPs[order(as.numeric(sub(scaffold_re, "", picked_SNPs$CHROM)), picked_SNPs$POS),]
  #picked_SNPs_us <- picked_SNPs[grep("unplaced_scaffold", picked_SNPs$CHROM),]
  #picked_SNPs_us <- picked_SNPs_us[order(as.numeric(sub("unplaced_scaffold", "", picked_SNPs_us$CHROM)), picked_SNPs_us$POS),]
  #picked_SNPs <- rbind(picked_SNPs_chr, picked_SNPs_us, stringsAsFactors = F)
  if(!is.null(hm_file)){
    picked_mat <- as.matrix( picked_SNPs[,-c(1,2)])
    colnames(picked_mat) <- names(picked_SNPs[,-c(1,2)])
    rownames(picked_mat) <- paste(picked_SNPs[,1], picked_SNPs[,2], sep = "_")
    pdf(file = hm_file, width = 10, height = 12)
    heatmap(picked_mat, scale = "none", Rowv = NA, labCol = colnames(picked_mat), labRow = rownames(picked_mat), col = colorRampPalette(colors = c("blue", "red"))(100), margins =c(20,12))
    dev.off()
  }
  return(list(picked_SNPs = picked_SNPs, min_dist = eval_vec[ best_set]))
}

SNP_context_strings_2 <- function(cSNP_set, ref_fasta, ref_SNPs, win_size = 100){
  require(GenomicRanges)
  require(Biostrings)
  names(cSNP_set)[grep("CHR|chr|scaffold", names(cSNP_set))] <-"CHR"
  names(cSNP_set)[grep("POS|pos", names(cSNP_set))] <- "POS"
  
  #cSNP_Ranges <- GRanges(seqnames = cSNP_set[,"scaffold"], ranges = IRanges(start = cSNP_set[,"POS"]-win_size, end = cSNP_set[,"POS"]+win_size))
  cSNP_Ranges <- GRanges(seqnames = cSNP_set[,"CHR"], ranges = IRanges(start = cSNP_set[,"POS"]-win_size, end = cSNP_set[,"POS"]+win_size))
  refSNP_Ranges <- GRanges(seqnames = ref_SNPs[,1], ranges = IRanges(start = ref_SNPs[,2], end = ref_SNPs[,2]))
  cSNP_strings <- array()
  cSNP_nSNPs <- array()
  for (tSNP in 1:(length(cSNP_Ranges))){
    target_SNP <- cSNP_set[tSNP,]
    covered_SNPs <- ref_SNPs[findOverlaps(cSNP_Ranges[tSNP], refSNP_Ranges)@to,]
    cSNP_nSNPs[tSNP] <- dim(covered_SNPs)[1]
    tSNP_index <- match(target_SNP[,"POS"], covered_SNPs[,"POS"])
    #Initialize the context string with segment up to first SNP
    if(!is.na(tSNP_index)){
      #cSNP_strings[tSNP] <- as.character(subseq(ref_fasta[target_SNP[,"scaffold"]], start = target_SNP[,"POS"] - win_size, end = covered_SNPs[1,"POS"]-1))
      cSNP_strings[tSNP] <- as.character(subseq(ref_fasta[target_SNP[,"CHR"]], start = target_SNP[,"POS"] - win_size, end = covered_SNPs[1,"POS"]-1))
      for(cSNP in 1:(dim(covered_SNPs)[1])){
        #Insert the current SNP
        if(cSNP != tSNP_index){
          cSNP_strings[tSNP] <- paste(cSNP_strings[tSNP],"(", covered_SNPs[cSNP, "REF"], "/", covered_SNPs[cSNP, "ALT"], ")", sep = "")
        }else{
          cSNP_strings[tSNP] <- paste(cSNP_strings[tSNP],"[", covered_SNPs[cSNP, "REF"], "/", covered_SNPs[cSNP, "ALT"], "]", sep = "")
        }
        #Extend with next segment
        if(cSNP < dim(covered_SNPs)[1]){
          #cSNP_strings[tSNP] <- paste(cSNP_strings[tSNP], subseq(ref_fasta[target_SNP[,"scaffold"]], start = covered_SNPs[cSNP,"POS"]+1 , end = covered_SNPs[cSNP+1,"POS"]-1), sep = "")
          cSNP_strings[tSNP] <- paste(cSNP_strings[tSNP], subseq(ref_fasta[target_SNP[,"CHR"]], start = covered_SNPs[cSNP,"POS"]+1 , end = covered_SNPs[cSNP+1,"POS"]-1), sep = "")
        }
      }
      #Add final Segment
      #cSNP_strings[tSNP] <- paste(cSNP_strings[tSNP], subseq(ref_fasta[target_SNP[,"scaffold"]], start = covered_SNPs[cSNP,"POS"]+1 , end = target_SNP[,"POS"] + win_size), sep = "")
      cSNP_strings[tSNP] <- paste(cSNP_strings[tSNP], subseq(ref_fasta[target_SNP[,"CHR"]], start = covered_SNPs[cSNP,"POS"]+1 , end = target_SNP[,"POS"] + win_size), sep = "")
    } else {
      cSNP_strings[tSNP] <- "Candidate SNP missing from reference set"
    }
  }
  #cSNP_context_df <- data.frame(scaffold = cSNP_set[, "scaffold"], pos = cSNP_set[, "POS"], local_SNPs = cSNP_nSNPs,context = cSNP_strings, stringsAsFactors = F)
  cSNP_context_df <- data.frame(CHROM= cSNP_set[, "CHR"], POS = cSNP_set[, "POS"], local_SNPs = cSNP_nSNPs,context = cSNP_strings, stringsAsFactors = F, SNP_id = paste(cSNP_set[, "CHR"],cSNP_set[, "POS"], sep = "_"))
  return(cSNP_context_df)
}
