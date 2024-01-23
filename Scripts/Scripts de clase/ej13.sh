
#!/bin/bash

for i in `$(seq $(($1+1)) $(($2-1)))`; do
    echo $i
done