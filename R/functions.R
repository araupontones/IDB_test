## Functions

## TO TRANSFORM CATEGORICAL VARIABLES FROM STATA TO R FACTORS
fn_labels = function(x){
  levels = attributes(x)$labels
  labels = names(levels)
  
  factor(x, 
         levels = levels,
         labels = labels)
  
}