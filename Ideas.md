Pseudo-code
===========

- [x] Plot histogram of data
- [ ] Create a list to hold the results for each break
- [x] For each of the breaks in the histogram ...
  - [ ] Split the data into before and after the break
  - [ ] For each split ...
    - [ ] Calculate the weight
    - [ ] Calculate the variance
    - [ ] Calculate the mean (do we really need this though?)
  - [ ] Calculate the within-class variance
    - Multiply the variance of each split by its weight and add them together
  - [ ] Append that to a list
- [ ] Find the smallest within-class variance
- [ ] Get the break corresponding to that smallest within-class variance

Key functions
=============

- `which` - gets the indices for the items in a list that match a condition -
  e.g. `which[data > 2]`
- `var` - calculate the variance
- `which.min` - finds the index of the smallest item in a list
- `min` - finds the smallest item in a list