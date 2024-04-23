while true
do
    ps -ef | grep "netswap0034" | grep -v "grep"
    if [ "$?" -eq 1 ]
        then
        ./netswap0034 $1 $2 $3 $4 $5 $6 $7 $8
    fi
    sleep 3
done