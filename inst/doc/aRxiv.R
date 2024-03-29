## ----be_graceful_on_cran, include=FALSE---------------------------------------
# if on cran, avoid errors when connection problems
on_cran <- Sys.getenv("NOT_CRAN")!="true"
if(on_cran) {
    aRxiv:::set_arxiv_timeout(1)
    aRxiv:::set_message_on_timeout(TRUE)
}

## ----change_aRxiv_delay_option, include=FALSE---------------------------------
options(aRxiv_delay=0.5)

## ----install_from_cran, eval=FALSE--------------------------------------------
#  install.packages("aRxiv")

## ----install_pkgs, eval=FALSE-------------------------------------------------
#  install.packages("remotes")
#  library(remotes)
#  install_github("ropensci/aRxiv")

## ----arxiv_count--------------------------------------------------------------
library(aRxiv)
arxiv_count('au:"Peter Hall"')

## ----arxiv_search-------------------------------------------------------------
rec <- arxiv_search('au:"Peter Hall"')
nrow(rec)

## ----arxiv_search_attr--------------------------------------------------------
attr(rec, "total_results")

## ----arxiv_search_limit100----------------------------------------------------
rec <- arxiv_search('au:"Peter Hall"', limit=100)
nrow(rec)

## ----arxiv_search_deconvolution-----------------------------------------------
deconv <- arxiv_search('au:"Peter Hall" AND ti:deconvolution')
nrow(deconv)

## ----authors_title------------------------------------------------------------
deconv[, c('title', 'authors')]

## ----arxiv_open, eval=FALSE---------------------------------------------------
#  arxiv_open(deconv)

## ----query_terms--------------------------------------------------------------
query_terms

## ----illustrate_AND-----------------------------------------------------------
arxiv_count('au:Peter au:Hall')
arxiv_count('au:Peter OR au:Hall')
arxiv_count('au:Peter AND au:Hall')
arxiv_count('au:Hall ANDNOT au:Peter')

## ----illustrate_wildcard------------------------------------------------------
arxiv_count('au:P* AND au:Hall')
arxiv_count('au:P AND au:Hall')
arxiv_count('au:"P Hall"')

## ----arxiv_cats_colnames------------------------------------------------------
colnames(arxiv_cats)

## ----arxiv_cats---------------------------------------------------------------
arxiv_cats[arxiv_cats$field=="Statistics", c("category", "short_description")]

## ----search_cats--------------------------------------------------------------
arxiv_count('cat:stat')
arxiv_count('cat:stat.AP')
arxiv_count('cat:stat*')

## ----wildcard_times-----------------------------------------------------------
arxiv_count('submittedDate:20071018*')

## ----wildcard_date------------------------------------------------------------
arxiv_count('submittedDate:2007*')

## ----daterange----------------------------------------------------------------
arxiv_count('submittedDate:[2007 TO 2008]')

## ----arxiv_search_result------------------------------------------------------
res <- arxiv_search('au:"Peter Hall"')
names(res)

## ----search_msc---------------------------------------------------------------
arxiv_count("cat:14J60")
arxiv_count("14J60")

## ----sortby_example-----------------------------------------------------------
res <- arxiv_search('au:"Peter Hall" AND ti:deconvolution',
                    sort_by="updated", ascending=FALSE)
res$updated

## ----aRxiv_delay, eval=FALSE--------------------------------------------------
#  options(aRxiv_delay=1)

## ----reset_to_defaults, include=FALSE-----------------------------------------
if(on_cran) {
    aRxiv:::set_arxiv_timeout(30)
    aRxiv:::set_message_on_timeout(FALSE)
}

