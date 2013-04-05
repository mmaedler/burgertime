# burger time!
prompt_bt() {
	NOON=`date -j -f "%Y-%m-%d %H:%M:%S" "$(date '+%Y-%m-%d 13:00:00')" "+%s"`
	NOW=`date +%s`

	if [ "$NOON" -lt "$NOW" ]; then
		NOON=$((NOON+86400))
	fi
	DIFF=$((NOON-NOW))
	printf -v BTIME ""%dh:%dm:%ds"" $(($DIFF/3600)) $(($DIFF%3600/60)) $(($DIFF%60))
	export PS1="\h:\W (🍔 -time in $BTIME)$ "	
}
PROMPT_COMMAND=prompt_bt
