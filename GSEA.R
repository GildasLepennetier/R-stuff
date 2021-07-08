#### required packages ####
require(DESeq2)
require(openxlsx)
require(BiocParallel)

#### make is parallel ####
register(MulticoreParam(4))
options(max.print=150)

#### get the gene expression matrix ####
COUNTS2 <- read.table("333TK_Human02_DGE_Matrix.txt",header=T,sep="\t");COUNT2_NAME="333TK_Human02"
rownames(COUNTS2)<-COUNTS2$GENE ; COUNTS2$GENE<-NULL
COUNTS2<-COUNTS2[,ANNOT$Barcode]
colnames(COUNTS2) <- paste0(colnames(COUNTS2),"-2")


#### get the annotation (exemple:) ####
ANNOT<-read.xlsx("333TK_Human02_SampleAnnotation.xlsx")
rownames(ANNOT)<-ANNOT$Barcode
#select only barcode of interest
ANNOT<-subset(ANNOT, Loaded == 1)
ANNOT$intgroup = paste(ANNOT$Descr_Organ, ANNOT$Descr_Cell.Type)
ANNOT$Descr_SAP.ID <- factor(ANNOT$Descr_SAP.ID)
ANNOT$TEST=factor(paste(ANNOT$Descr_Organ,ANNOT$Descr_Cell.Type,sep="_"))


#### Run DESEQ2 #### 
# to normalilzed auto. The model used should not influence the normalization step
dds <- DESeqDataSetFromMatrix(countData = COUNTS2, colData = ANNOT,design= ~ TEST)
dds <- DESeq(dds,parallel=T)

#### Save data as GSEA-ready ####

DF = cbind(GeneID=rownames(dds), Description=NA, as.data.frame(counts(dds,normalized=TRUE)))
GENES=rownames(dds)

# inclusing Ribo / Mito genes
TAG_sel="WithRiboMito"

#GENES <- grep(pattern = "^RP[SL]",GENES,value=T,invert=T)
#GENES <- grep(pattern = "^MT-",GENES,value=T,invert=T)
#TAG_sel="NoRiboMito"
#DF<-DF[GENES,]

#1.2
#nbGenes NbColumns
FILENAME = paste0( c(COUNT_NAME,TAG_sel,"NormExpr","gct") ,collapse=".")
write("#1.2",file=FILENAME,append=F,sep="\t")
write(c( length(rownames(dds)) , length(colnames(dds)) ),file=FILENAME,sep="\t",append=T)
write.table(x=DF,file=FILENAME,sep="\t",quote=F,row.names=F,append=T)

FILENAME = paste0( c(COUNT_NAME,TAG_sel,"Pheno","cls") ,collapse=".")
nbSamples=length(colnames(dds))
nbClasses=length(unique(ANNOT$TEST))
VALUES=c(nbSamples,nbClasses,"1")
write(VALUES,file=FILENAME,append=F,sep="\t",ncolumns=length(VALUES))
VALUES=c("#", as.character(unique(ANNOT$TEST) ) )
write(VALUES,file=FILENAME,append=T,sep="\t",ncolumns=length(VALUES))
VALUES=as.character(ANNOT$TEST)
write(VALUES,file=FILENAME,append=T,sep="\t",ncolumns=length(VALUES))

